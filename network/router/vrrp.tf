
resource "routeros_interface_vrrp" "interface_vrrp" {
  interface = routeros_vlan.vlan["vlan21"].name # depend on interface we on
  name      = "vrrp_dns"
  priority = "100"
  version = "2"
  #v3_protocol = "ipv4"
  vrid = "2"
}

# Add VLAN interfaces to LAN list
resource "routeros_interface_list_member" "lan-vrrp" {
  interface = routeros_interface_vrrp.interface_vrrp.name
  list      = routeros_interface_list.lan.name
}

# ipv4 ip address
resource "routeros_ip_address" "vrrp-ipv4" {
  interface = routeros_interface_vrrp.interface_vrrp.name
  address = "10.0.21.5/24"
  comment = "vrrp_dns"
}

# ipv6 ip address - private
resource "routeros_ipv6_address" "vrrp-ipv6-private" {
  interface = routeros_interface_vrrp.interface_vrrp.name
  address = "fd00:21::5/64"
  comment = "vrrp_dns"
  advertise = true
}