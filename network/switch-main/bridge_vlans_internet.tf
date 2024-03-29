# create vlans
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_vlan
resource "routeros_interface_bridge_vlan" "bridge_vlan10" {
  vlan_ids = 10
  bridge    = routeros_interface_bridge.bridge.name
  untagged = ["ether2", "ether3"]
  comment = "vlan10-ftth"
}