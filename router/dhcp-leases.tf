resource "mikrotik_dhcp_lease" "laptop_david_work" {
  address = "192.168.241.41"
  macaddress = "F4:5C:89:AF:2F:E9"
  comment = "laptop-david-work"
  hostname = "f45c89af2fe9"
}

resource "mikrotik_dhcp_lease" "laptop_karen_work" {
  address = "192.168.241.42"
  macaddress = "88:E9:FE:88:AB:FE"
  comment = "laptop-karen-work"
  hostname = "88e9fe88abfe"
}