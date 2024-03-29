# Laptops
# resource "routeros_ip_dhcp_server_lease" "laptop_david_work_lan" {
#   address = "10.0.0.40"
#   mac_address = "98:FC:84:E8:3E:52"
#   comment = "laptop-david-work-lan"
# # hostname = "909c4ace21ef"
# }
# resource "routeros_ip_dhcp_server_lease" "laptop_david_work_wifi" {
#   address = "10.0.0.41"
#   mac_address = "90:9C:4A:CE:21:EF"
#   comment = "laptop-david-work-wifi"
# # hostname = "909c4ace21ef"
# }
# resource "routeros_ip_dhcp_server_lease" "laptop_karen_work" {
#   address = "10.0.0.42"
#   mac_address = "88:E9:FE:88:AB:FE"
#   comment = "laptop-karen-work"
# # hostname = "88e9fe88abfe"
# }

### Legacy VLANs

resource "routeros_ip_dhcp_server_lease" "envisalink" {
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan01"].name
  # server = routeros_ip_dhcp_server.vlan20-ipv4-dhcp-server.name
  address = "10.0.1.18" #240
  mac_address = "00:1C:2A:02:1F:06"
  comment = "envisalink-alarm-module"
# hostname = "EnvisaLink"
}

resource "routeros_ip_dhcp_server_lease" "af1515_printer" {
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan01"].name
  # server = routeros_ip_dhcp_server.vlan20-ipv4-dhcp-server.name
  address = "10.0.1.251"
  mac_address = "00:00:74:A7:F5:3C"
  comment = "af1515-printer"
}

# IP Cameras
# resource "routeros_ip_dhcp_server_lease" "camera_front" {
#   server = routeros_ip_dhcp_server.vlan24-ipv4-dhcp-server.name
#   address = "10.0.6.21"
#   mac_address = "44:B2:95:61:99:08"
#   comment = "camera-front"
# # hostname = "D04608317"
# }

resource "routeros_ip_dhcp_server_lease" "camera_front" {
  # server = routeros_ip_dhcp_server.vlan24-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan23"].name
  address = "10.0.23.21"
  mac_address = "98:F1:12:E9:FD:AA"
  comment = "camera-front-garage"
# hostname = "hikvision"
}

resource "routeros_ip_dhcp_server_lease" "camera_back" {
  # server = routeros_ip_dhcp_server.vlan23-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan23"].name
  address = "10.0.23.22"
  mac_address = "98:8B:0A:96:98:AA"
  comment = "camera-back"
# hostname = "D04608194"
}

### Physical Servers
resource "routeros_ip_dhcp_server_lease" "diskstation" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.10"
  mac_address = "00:11:32:AC:34:CB"
  comment = "synology-nas"
# hostname = "diskstation"
}

### Virtual Servers
resource "routeros_ip_dhcp_server_lease" "bastion" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.8"
  mac_address = "BE:AF:7F:80:71:8E"
  comment = "bastion"
}

resource "routeros_ip_dhcp_server_lease" "ns1" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.6"
  mac_address = "62:3A:F1:3B:8F:2B"
  comment = "ns1"
}

resource "routeros_ip_dhcp_server_lease" "netm" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.15"
  mac_address = "5A:2C:7E:E5:8E:A4"
  comment = "netm"
# hostname = "netm"
}
resource "routeros_ip_dhcp_server_lease" "stax" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.13"
  mac_address = "A6:6E:87:6D:37:27"
  comment = "stax"
# hostname = "stax"
}
resource "routeros_ip_dhcp_server_lease" "mail" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.19"
  mac_address = "1A:5D:DB:9A:BA:5F"
  comment = "mail"
}
resource "routeros_ip_dhcp_server_lease" "cloudbox" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.20"
  mac_address = "52:AA:A4:13:42:12"
  comment = "cloudbox"
# hostname = "cloudbox"
}
resource "routeros_ip_dhcp_server_lease" "windows-server" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.21"
  mac_address = "96:5D:29:33:61:BE"
  comment = "windows-server"
# hostname = "WIN-SEAOKHV7CS6"
}
resource "routeros_ip_dhcp_server_lease" "deepstack" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.22"
  mac_address = "6E:71:A9:F1:0D:99"
  comment = "deepstack"
# hostname = "deepstack"
}
resource "routeros_ip_dhcp_server_lease" "mktxp" {
  #server = routeros_ip_dhcp_server.vlan21-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.23"
  mac_address = "82:21:61:7E:3F:D4"
  comment = "mktxp"
# hostname = "mktxp"
}
resource "routeros_ip_dhcp_server_lease" "saltbox" {
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan21"].name
  address = "10.0.21.24"
  mac_address = "EE:DF:21:42:B3:BA"
  comment = "saltbox"
# hostname = "saltbox"
}

### IOT
resource "routeros_ip_dhcp_server_lease" "bambulab-x1c-legend" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.7"
  mac_address = "B8:13:32:82:51:EA"
  comment = "bambulab-x1c-legend"
}

resource "routeros_ip_dhcp_server_lease" "home-assistant" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.9"
  mac_address = "B6:4A:29:1F:8C:41"
  comment = "home-assistant"
# hostname = "home-assistant"
}

resource "routeros_ip_dhcp_server_lease" "haa" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.8"
  mac_address = "9A:EB:DA:2D:5C:CB"
  comment = "haa"
}

resource "routeros_ip_dhcp_server_lease" "goodwe_inverter" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.10"
  mac_address = "98:D8:63:80:30:64"
  comment = "goodwe-inverter"
# hostname = "HF-LPB100"
}
resource "routeros_ip_dhcp_server_lease" "pethub" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.16" #235
  mac_address = "7E:7C:37:AA:D4:1D"
  comment = "pethub"
# hostname = "pethub"
}
resource "routeros_ip_dhcp_server_lease" "midea_ac_1" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.11"
  mac_address = "C4:39:60:C2:2E:14"
  comment = "midea-ac-1"
}
resource "routeros_ip_dhcp_server_lease" "midea_ac_2" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.12"
  mac_address = "C4:39:60:BD:5A:54"
  comment = "midea-ac-2"
}
resource "routeros_ip_dhcp_server_lease" "midea_ac_3" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.13"
  mac_address = "C4:39:60:BD:59:64"
  comment = "midea-ac-3"
}
resource "routeros_ip_dhcp_server_lease" "zigbeegateway" {
  # server = routeros_ip_dhcp_server.vlan22-ipv4-dhcp-server.name
  server = routeros_ip_dhcp_server.ipv4-dhcp-server["vlan22"].name
  address = "10.0.22.19"
  mac_address = "A4:CF:12:DC:0B:8C"
  comment = "sonoff-zigbee-gateway"
# hostname   = "tasmota-DC0B8C-2956"
}