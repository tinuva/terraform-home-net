locals {
  address_list = distinct(flatten([
    for list, addresses in var.ipv4_firewall_address_lists : [
      for address in addresses : { 
            list = list
            address = address
        }
    ]
  ]))

  # https://discuss.hashicorp.com/t/does-map-sort-keys/12056/2
  # Map keys are always iterated in lexicographical order!
  filter_rule_map = { for idx, rule in var.ipv4_firewall_filter_rules : format("%03d", idx) => rule }
  nat_rule_map = { for idx, rule in var.ipv4_firewall_nat_rules : format("%03d", idx) => rule }
}

## Address lists
resource "routeros_firewall_addr_list" "firewall_address_lists" {
  for_each      = { for entry in local.address_list: "${entry.list}.${entry.address}" => entry }

  address = each.value.address
  list = each.value.list
}

## Filter rules
resource "routeros_ip_firewall_filter" "rules" {
  for_each          = local.filter_rule_map

  chain             = each.value.chain
  action            = each.value.action
  comment           = each.value.comment
  log               = each.value.log
  disabled          = each.value.disabled
  connection_state  = each.value.connection_state
  connection_nat_state = each.value.connection_nat_state
  in_interface = each.value.in_interface
  out_interface = each.value.out_interface
  in_interface_list = each.value.in_interface_list
  out_interface_list = each.value.out_interface_list
  src_address       = each.value.src_address
  dst_address       = each.value.dst_address
  src_address_list  = each.value.src_address_list
  dst_address_list  = each.value.dst_address_list
  src_port          = each.value.src_port
  dst_port          = each.value.dst_port
  protocol          = each.value.protocol
  ipsec_policy      = each.value.ipsec_policy
  hw_offload        = each.value.hw_offload
  depends_on    = [routeros_firewall_addr_list.firewall_address_lists]
}

## Order filter rules
resource "routeros_move_items" "fw_rules" {
  #  resource_name = "routeros_ip_firewall_filter"
  resource_path = "/ip/firewall/filter"
  sequence      = [for i, _ in local.filter_rule_map : routeros_ip_firewall_filter.rules[i].id]
  depends_on    = [routeros_ip_firewall_filter.rules]
}

## Nat rules
resource "routeros_ip_firewall_nat" "rules" {
  for_each          = local.nat_rule_map

  chain             = each.value.chain
  action            = each.value.action
  comment           = each.value.comment
  log               = each.value.log
  disabled          = each.value.disabled
  in_interface_list = each.value.in_interface_list
  out_interface_list = each.value.out_interface_list
  src_address       = each.value.src_address
  dst_address       = each.value.dst_address
  src_address_list  = each.value.src_address_list
  dst_address_list  = each.value.dst_address_list
  to_addresses      = each.value.to_addresses
  src_port          = each.value.src_port
  dst_port          = each.value.dst_port
  protocol          = each.value.protocol
  ipsec_policy      = each.value.ipsec_policy
  depends_on    = [routeros_firewall_addr_list.firewall_address_lists]
}

## Order nat rules
resource "routeros_move_items" "nat_rules" {
  #  resource_name = "routeros_ip_firewall_nat"
  resource_path = "/ip/firewall/nat"
  sequence      = [for i, _ in local.nat_rule_map : routeros_ip_firewall_nat.rules[i].id]
  depends_on    = [routeros_ip_firewall_nat.rules]
}