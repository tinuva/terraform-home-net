

# create vlans for LAN usage
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_vlan
resource "routeros_interface_bridge_vlan" "bridge_vlan" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  vlan_ids = [each.value.vlan]
  bridge    = routeros_interface_bridge.bridge.name
  untagged  = [for port, detail in var.router_bridge_ports: port if detail.untagged_vlan == each.value.vlan ]
  tagged    = concat(["bridge"], [for port, detail in var.router_bridge_ports: port if contains(detail.tagged_vlans, each.value.vlan) ])
  comment = "${each.key}-${each.value.name}"
}

# Add VLAN interfaces to LAN list
resource "routeros_interface_list_member" "lan-vlan" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  interface = routeros_interface_vlan.vlan[each.key].name
  list      = routeros_interface_list.lan.name
}

# create layer3 vlan interface. to add ip addresses to
resource "routeros_interface_vlan" "vlan" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  interface = routeros_interface_bridge.bridge.name
  name = "${each.key}-${each.value.name}"
  vlan_id = each.value.vlan
  comment = "${each.key}-${each.value.name}"
}
