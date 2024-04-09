# create a bridge named "bridge"
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge
resource "routeros_interface_bridge" "bridge" {
  name           = "bridge"
  vlan_filtering = true
  # protocol_mode  = "none" # disable until 3com switch removed
  #priority = 2328 # this keeps updating itself, leaving it out now
}

# ensure allow_fast_path is set
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_settings
resource "routeros_interface_bridge_settings" "settings" {
  allow_fast_path = true
}

# add ports to bridge
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_port
resource "routeros_interface_bridge_port" "bridge_port" {
  #for_each = var.router_bridge_ports
  for_each = {
    for key, value in var.router_bridge_ports :
      key => value if value.untagged_vlan != 0
  }

  bridge    = routeros_interface_bridge.bridge.name
  interface = each.key 
  pvid      = each.value.untagged_vlan
  trusted   = true # REQUIRED for DHCP to function
  ingress_filtering = true
  comment   = each.value.name
}

# add comments to ports for identification
resource "routeros_interface_ethernet" "port" {
  for_each = var.router_bridge_ports

  factory_name = each.key
  name         = each.key
  comment      = each.value.name
}