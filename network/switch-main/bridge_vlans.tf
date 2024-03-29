# create a bridge named "bridge"
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge
resource "routeros_interface_bridge" "bridge" {
  name           = "bridge"
  vlan_filtering = true
  # protocol_mode  = "none" # disable until 3com switch removed
}

# ensure allow_fast_path is set
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_settings
resource "routeros_interface_bridge_settings" "settings" {
  allow_fast_path = true
}

# add ports to bridge
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_port
resource "routeros_interface_bridge_port" "bridge_port" {
  for_each = var.switch_bridge_ports
  
  bridge    = routeros_interface_bridge.bridge.name
  interface = each.key 
  pvid      = each.value
  trusted   = true # REQUIRED for DHCP to function
  ingress_filtering = true
}

# create vlans
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_vlan
resource "routeros_interface_bridge_vlan" "bridge_vlan" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  vlan_ids = each.value.vlan
  bridge    = routeros_interface_bridge.bridge.name
  tagged = concat(["bridge"], each.value.switch_ports_tagged)  # always add vlan as tagged to the bridge itself
  untagged = each.value.switch_ports_untagged
  comment = "${each.key}-${each.value.name}"
}

# create layer3 vlan interface to add ip addresses to
# resource "routeros_vlan" "vlan" {
#   for_each = {
#     for key, val in var.bridge_vlans :
#       key => val if val.is_enabled
#   }
# 
#   interface = routeros_interface_bridge.bridge.name
#   name = "${each.key}-${each.value.name}"
#   vlan_id = each.value.vlan
#   comment = "${each.key}-${each.value.name}"
# }
