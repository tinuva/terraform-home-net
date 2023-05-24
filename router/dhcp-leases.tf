# Laptops
# resource "routeros_dhcp_server_lease" "laptop_david_work_lan" {
#   address = "10.0.0.40"
#   mac_address = "98:FC:84:E8:3E:52"
#   comment = "laptop-david-work-lan"
# # hostname = "909c4ace21ef"
# }
# resource "routeros_dhcp_server_lease" "laptop_david_work_wifi" {
#   address = "10.0.0.41"
#   mac_address = "90:9C:4A:CE:21:EF"
#   comment = "laptop-david-work-wifi"
# # hostname = "909c4ace21ef"
# }
# resource "routeros_dhcp_server_lease" "laptop_karen_work" {
#   address = "10.0.0.42"
#   mac_address = "88:E9:FE:88:AB:FE"
#   comment = "laptop-karen-work"
# # hostname = "88e9fe88abfe"
# }

### Legacy VLANs

resource "routeros_dhcp_server_lease" "envisalink" {
  server = "defconf"
  address = "10.0.0.18" #240
  mac_address = "00:1C:2A:02:1F:06"
  comment = "envisalink-alarm-module"
# hostname = "EnvisaLink"
}

resource "routeros_dhcp_server_lease" "AF1515_printer" {
  server = "defconf"
  address = "10.0.0.251"
  mac_address = "00:00:74:A7:F5:3C"
  comment = "AF1515-printer"
}

# IP Cameras
resource "routeros_dhcp_server_lease" "camera_front" {
  server = routeros_dhcp_server.vlan24-ipv4-dhcp-server.name
  address = "10.0.6.21"
  mac_address = "44:B2:95:61:99:08"
  comment = "camera-front"
# hostname = "D04608317"
}
resource "routeros_dhcp_server_lease" "camera_back" {
  server = routeros_dhcp_server.vlan23-ipv4-dhcp-server.name
  address = "10.0.5.22"
  mac_address = "98:8B:0A:96:98:AA"
  comment = "camera-back"
# hostname = "D04608194"
}


### Physical Servers
resource "routeros_dhcp_server_lease" "diskstation" {
  server = routeros_dhcp_server.vlan21-ipv4-dhcp-server.name
  address = "10.0.3.10"
  mac_address = "00:11:32:AC:34:CB"
  comment = "synology-nas"
# hostname = "diskstation"
}

### Virtual Servers
resource "routeros_dhcp_server_lease" "home-assistant" {
  server = routeros_dhcp_server.vlan21-ipv4-dhcp-server.name
  address = "10.0.3.14"
  mac_address = "B6:4A:29:1F:8C:41"
  comment = "home-assistant"
# hostname = "home-assistant"
}
resource "routeros_dhcp_server_lease" "netm" {
  server = routeros_dhcp_server.vlan21-ipv4-dhcp-server.name
  address = "10.0.3.15"
  mac_address = "5A:2C:7E:E5:8E:A4"
  comment = "netm"
# hostname = "netm"
}
resource "routeros_dhcp_server_lease" "mail" {
  server = routeros_dhcp_server.vlan21-ipv4-dhcp-server.name
  address = "10.0.3.19"
  mac_address = "1A:5D:DB:9A:BA:5F"
  comment = "mail"
}
resource "routeros_dhcp_server_lease" "cloudbox" {
  server = routeros_dhcp_server.vlan21-ipv4-dhcp-server.name
  address = "10.0.3.20"
  mac_address = "52:AA:A4:13:42:12"
  comment = "cloudbox"
# hostname = "cloudbox"
}
resource "routeros_dhcp_server_lease" "windows-server" {
  server = routeros_dhcp_server.vlan21-ipv4-dhcp-server.name
  address = "10.0.3.21"
  mac_address = "96:5D:29:33:61:BE"
  comment = "windows-server"
# hostname = "WIN-SEAOKHV7CS6"
}
resource "routeros_dhcp_server_lease" "deepstack" {
  server = routeros_dhcp_server.vlan21-ipv4-dhcp-server.name
  address = "10.0.3.22"
  mac_address = "6E:71:A9:F1:0D:99"
  comment = "deepstack"
# hostname = "deepstack"
}
resource "routeros_dhcp_server_lease" "mktxp" {
  server = routeros_dhcp_server.vlan21-ipv4-dhcp-server.name
  address = "10.0.3.23"
  mac_address = "82:21:61:7E:3F:D4"
  comment = "mktxp"
# hostname = "mktxp"
}

### IOT
resource "routeros_dhcp_server_lease" "goodwe_inverter" {
  server = routeros_dhcp_server.vlan22-ipv4-dhcp-server.name
  address = "10.0.4.10"
  mac_address = "98:D8:63:80:30:64"
  comment = "goodwe-inverter"
# hostname = "HF-LPB100"
}
resource "routeros_dhcp_server_lease" "pethub" {
  server = routeros_dhcp_server.vlan22-ipv4-dhcp-server.name
  address = "10.0.4.16" #235
  mac_address = "7E:7C:37:AA:D4:1D"
  comment = "pethub"
# hostname = "pethub"
}
resource "routeros_dhcp_server_lease" "midea_ac_1" {
  server = routeros_dhcp_server.vlan22-ipv4-dhcp-server.name
  address = "10.0.4.11"
  mac_address = "C4:39:60:C2:2E:14"
  comment = "midea-ac-1"
}
resource "routeros_dhcp_server_lease" "midea_ac_2" {
  server = routeros_dhcp_server.vlan22-ipv4-dhcp-server.name
  address = "10.0.4.12"
  mac_address = "C4:39:60:BD:5A:54"
  comment = "midea-ac-2"
}
resource "routeros_dhcp_server_lease" "midea_ac_3" {
  server = routeros_dhcp_server.vlan22-ipv4-dhcp-server.name
  address = "10.0.4.13"
  mac_address = "C4:39:60:BD:59:64"
  comment = "midea-ac-3"
}
resource "routeros_dhcp_server_lease" "zigbeegateway" {
  server = routeros_dhcp_server.vlan22-ipv4-dhcp-server.name
  address = "10.0.4.19"
  mac_address = "A4:CF:12:DC:0B:8C"
  comment = "sonoff-zigbee-gateway"
# hostname   = "tasmota-DC0B8C-2956"
}