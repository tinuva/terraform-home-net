### wifi ports on 3com: 9,15,18
### ether3 tik on 3com: 3

### INTERFACE LISTS
resource "mikrotik_interface_list" "lan" {
  name    = "LAN"
  comment = "All LAN ethernet interfaces - temp"
}

### VLAN 20
#
resource "routeros_vlan" "vlan20" {
  interface = "ether3"
  name = "ether3.20"
  vlan_id = 20
  comment = "clients"
}
resource "routeros_ip_address" "vlan20-ipv4" {
  interface = routeros_vlan.vlan20.name
  address = "10.0.2.1/24"
  comment = "vlan20-clients"
}
resource "routeros_ip_pool" "vlan20-ipv4-pool" {
  name = "vlan20-clients"
  ranges = ["10.0.2.101-10.0.2.240"]
}
resource "routeros_dhcp_server_network" "vlan20-ipv4-dhcp-server-network" {
  address = "10.0.2.0/24"
  gateway = "10.0.2.1"
  dns_server = "10.0.3.2"
  ntp_server = "10.0.2.1"
}
resource "routeros_dhcp_server" "vlan20-ipv4-dhcp-server" {
  name = "vlan20-clients"
  interface = routeros_vlan.vlan20.name
  address_pool = routeros_ip_pool.vlan20-ipv4-pool.name
  lease_time = "10m"
}
resource "mikrotik_interface_list_member" "lan-vlan20" {
  interface = routeros_vlan.vlan20.name
  list      = mikrotik_interface_list.lan.name
}


### VLAN 21
#
resource "routeros_vlan" "vlan21" {
  interface = "ether3"
  name = "ether3.21"
  vlan_id = 21
  comment = "servers"
}
resource "routeros_ip_address" "vlan21-ipv4" {
  interface = routeros_vlan.vlan21.name
  address = "10.0.3.1/24"
  comment = "vlan21-servers"
}
resource "mikrotik_ipv6_address" "vlan21-ipv6" {
  interface = routeros_vlan.vlan21.name
  address = "2600:70ff:e831:21::1/64"
  comment = "vlan21-servers"
  advertise = true
}
resource "routeros_ip_pool" "vlan21-ipv4-pool" {
  name = "vlan21-servers"
  ranges = ["10.0.3.101-10.0.3.240"]
}
resource "routeros_dhcp_server_network" "vlan21-ipv4-dhcp-server-network" {
  address = "10.0.3.0/24"
  gateway = "10.0.3.1"
  dns_server = "10.0.3.2"
  ntp_server = "10.0.3.1"
}
resource "routeros_dhcp_server" "vlan21-ipv4-dhcp-server" {
  name = "vlan21-servers"
  interface = routeros_vlan.vlan21.name
  address_pool = routeros_ip_pool.vlan21-ipv4-pool.name
  lease_time = "4w3d"
}
resource "mikrotik_interface_list_member" "lan-vlan21" {
  interface = routeros_vlan.vlan21.name
  list      = mikrotik_interface_list.lan.name
}

### VLAN 22
#
resource "routeros_vlan" "vlan22" {
  interface = "ether3"
  name = "ether3.22"
  vlan_id = 22
  comment = "iot"
}
resource "routeros_ip_address" "vlan22-ipv4" {
  interface = routeros_vlan.vlan22.name
  address = "10.0.4.1/24"
  comment = "vlan22-iot"
}
resource "routeros_ip_pool" "vlan22-ipv4-pool" {
  name = "vlan22-iot"
  ranges = ["10.0.4.101-10.0.4.240"]
}
resource "routeros_dhcp_server_network" "vlan22-ipv4-dhcp-server-network" {
  address = "10.0.4.0/24"
  gateway = "10.0.4.1"
  dns_server = "10.0.3.2"
  ntp_server = "10.0.4.1"
}
resource "routeros_dhcp_server" "vlan22-ipv4-dhcp-server" {
  name = "vlan22-iot"
  interface = routeros_vlan.vlan22.name
  address_pool = routeros_ip_pool.vlan22-ipv4-pool.name
  lease_time = "4w3d"
}
resource "mikrotik_interface_list_member" "lan-vlan22" {
  interface = routeros_vlan.vlan22.name
  list      = mikrotik_interface_list.lan.name
}

### VLAN 23
#
resource "routeros_vlan" "vlan23" {
  interface = "ether3"
  name = "ether3.23"
  vlan_id = 23
  comment = "iot2"
}
resource "routeros_ip_address" "vlan23-ipv4" {
  interface = routeros_vlan.vlan23.name
  address = "10.0.5.1/24"
  comment = "vlan23-iot2"
}
resource "routeros_ip_pool" "vlan23-ipv4-pool" {
  name = "vlan23-iot2"
  ranges = ["10.0.5.101-10.0.5.240"]
}
resource "routeros_dhcp_server_network" "vlan23-ipv4-dhcp-server-network" {
  address = "10.0.5.0/24"
  gateway = "10.0.5.1"
  dns_server = "10.0.3.2"
  ntp_server = "10.0.5.1"
}
resource "routeros_dhcp_server" "vlan23-ipv4-dhcp-server" {
  name = "vlan23-iot2"
  interface = routeros_vlan.vlan23.name
  address_pool = routeros_ip_pool.vlan23-ipv4-pool.name
  lease_time = "4w3d"
}
resource "mikrotik_interface_list_member" "lan-vlan23" {
  interface = routeros_vlan.vlan23.name
  list      = mikrotik_interface_list.lan.name
}

### VLAN 24
#
resource "routeros_vlan" "vlan24" {
  interface = "ether3"
  name = "ether3.24"
  vlan_id = 24
  comment = "legacy-wifi"
}
resource "routeros_ip_address" "vlan24-ipv4" {
  interface = routeros_vlan.vlan24.name
  address = "10.0.6.1/24"
  comment = "vlan24-legacy-wifi"
}
resource "routeros_ip_pool" "vlan24-ipv4-pool" {
  name = "vlan24-legacy-wifi"
  ranges = ["10.0.6.101-10.0.6.240"]
}
resource "routeros_dhcp_server_network" "vlan24-ipv4-dhcp-server-network" {
  address = "10.0.6.0/24"
  gateway = "10.0.6.1"
  dns_server = "10.0.3.2"
  ntp_server = "10.0.6.1"
}
resource "routeros_dhcp_server" "vlan24-ipv4-dhcp-server" {
  name = "vlan24-legacy-wifi"
  interface = routeros_vlan.vlan24.name
  address_pool = routeros_ip_pool.vlan24-ipv4-pool.name
  lease_time = "4w3d"
}
#resource "mikrotik_interface_list_member" "lan-vlan24" {
#  interface = routeros_vlan.vlan24.name
#  list      = mikrotik_interface_list.lan.name
#}