# create interface list for LAN
resource "routeros_interface_list" "lan" {
  name = "LAN"
}

resource "routeros_interface_list" "wan" {
  name = "WAN"
}
