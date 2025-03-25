# create vlans for passing internet through
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_vlan
resource "routeros_interface_bridge_vlan" "bridge_vlan10" {
  vlan_ids  = ["10"]
  bridge    = routeros_interface_bridge.bridge.name
  untagged  = [for port, detail in var.switch_bridge_ports: port if detail.untagged_vlan == 10 ]
  tagged    = [for port, detail in var.switch_bridge_ports: port if contains(detail.tagged_vlans, 10) ]
  comment   = "vlan10-ftth"
}
