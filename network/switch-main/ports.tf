# configure ports- mostly add comments to ports for identification
resource "routeros_interface_ethernet" "port" {
  for_each = var.switch_bridge_ports

  factory_name = each.key
  name         = each.key
  comment      = each.value.name
}