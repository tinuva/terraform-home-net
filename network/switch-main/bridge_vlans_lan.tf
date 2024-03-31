# create vlans for lan usage
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_vlan
resource "routeros_interface_bridge_vlan" "bridge_vlan" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  vlan_ids  = each.value.vlan
  bridge    = routeros_interface_bridge.bridge.name
  untagged  = [for port, detail in var.switch_bridge_ports: port if detail.untagged_vlan == each.value.vlan ]
  tagged    = concat(["bridge"], [for port, detail in var.switch_bridge_ports: port if contains(detail.tagged_vlans, each.value.vlan) ])
  comment   = "${each.key}-${each.value.name}"
}
