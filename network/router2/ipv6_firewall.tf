locals {
  ipv6_address_list = distinct(flatten([
    for list, items in var.ipv6_firewall_address_lists : [
      for item in items : { 
            list = list
            address = item.address
            comment = item.comment
        }
    ]
  ]))

  # https://discuss.hashicorp.com/t/does-map-sort-keys/12056/2
  # Map keys are always iterated in lexicographical order!
  ipv6_filter_rule_map = { for idx, rule in var.ipv6_firewall_filter_rules : format("%03d", idx) => rule }
}

## Address lists
resource "routeros_ipv6_firewall_addr_list" "firewall_ipv6_address_lists" {
  for_each      = { for entry in local.ipv6_address_list: "${entry.list}.${entry.address}" => entry }

  address = each.value.address
  list = each.value.list
  comment = each.value.comment
}

# disabled until all interfaces work
# ## Filter rules
# resource "routeros_ipv6_firewall_filter" "ipv6_rules" {
#   for_each          = local.ipv6_filter_rule_map
# 
#   chain             = each.value.chain
#   action            = each.value.action
#   comment           = each.value.comment
#   log               = each.value.log
#   disabled          = each.value.disabled
#   connection_state  = each.value.connection_state
#   in_interface = each.value.in_interface
#   out_interface = each.value.out_interface
#   in_interface_list = each.value.in_interface_list
#   out_interface_list = each.value.out_interface_list
#   src_address       = each.value.src_address
#   dst_address       = each.value.dst_address
#   src_address_list  = each.value.src_address_list
#   dst_address_list  = each.value.dst_address_list
#   src_port          = each.value.src_port
#   dst_port          = each.value.dst_port
#   protocol          = each.value.protocol
#   ipsec_policy      = each.value.ipsec_policy
#   hop_limit         = each.value.hop_limit
#   depends_on    = [routeros_ipv6_firewall_addr_list.firewall_ipv6_address_lists]
# }
# 
# ## Order filter rules
# resource "routeros_move_items" "ipv6_fw_rules" {
#   #  resource_name = "routeros_ipv6_firewall_filter"
#   resource_path = "/ipv6/firewall/filter"
#   sequence      = [for i, _ in local.ipv6_filter_rule_map : routeros_ipv6_firewall_filter.ipv6_rules[i].id]
#   depends_on    = [routeros_ipv6_firewall_filter.ipv6_rules]
# }
# 