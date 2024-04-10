locals {
  # https://discuss.hashicorp.com/t/does-map-sort-keys/12056/2
  # Map keys are always iterated in lexicographical order!
  rule_map = { for idx, rule in var.ipv4_firewall_filter_rules : format("%03d", idx) => rule }
}

resource "routeros_ip_firewall_filter" "rules" {
  for_each          = local.rule_map

  chain             = each.value.chain
  action            = each.value.action
  comment           = each.value.comment
  log               = each.value.log
  disabled          = each.value.disabled
  connection_state  = each.value.connection_state
  in_interface_list = each.value.in_interface_list
  src_address       = each.value.src_address
  dst_port          = each.value.dst_port
  protocol          = each.value.protocol
}

resource "routeros_move_items" "fw_rules" {
  #  resource_name = "routeros_ip_firewall_filter"
  resource_path = "/ip/firewall/filter"
  sequence      = [for i, _ in local.rule_map : routeros_ip_firewall_filter.rules[i].id]
  depends_on    = [routeros_ip_firewall_filter.rules]
}