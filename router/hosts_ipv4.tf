
# Create ipv4 dhcp leases for hosts
resource "routeros_ip_dhcp_server_lease" "hostlease" {
  for_each = var.hosts

  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan${each.value.vlan}"].name
  address = "10.0.${each.value.vlan}.${each.value.ip_suffix}"
  mac_address = "${each.value.mac_addr}"
  comment = "${each.key}"
}