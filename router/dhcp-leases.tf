# Laptops
# resource "mikrotik_dhcp_lease" "laptop_david_work_lan" {
#   address = "10.0.0.40"
#   macaddress = "98:FC:84:E8:3E:52"
#   comment = "laptop-david-work-lan"
# # hostname = "909c4ace21ef"
# }
# resource "mikrotik_dhcp_lease" "laptop_david_work_wifi" {
#   address = "10.0.0.41"
#   macaddress = "90:9C:4A:CE:21:EF"
#   comment = "laptop-david-work-wifi"
# # hostname = "909c4ace21ef"
# }
# resource "mikrotik_dhcp_lease" "laptop_karen_work" {
#   address = "10.0.0.42"
#   macaddress = "88:E9:FE:88:AB:FE"
#   comment = "laptop-karen-work"
# # hostname = "88e9fe88abfe"
# }



### IOT
resource "mikrotik_dhcp_lease" "goodwe_inverter" {
  address = "10.0.4.10"
  macaddress = "98:D8:63:80:30:64"
  comment = "goodwe-inverter"
# hostname = "HF-LPB100"
}
resource "mikrotik_dhcp_lease" "pethub" {
  address = "10.0.4.16" #235
  macaddress = "7E:7C:37:AA:D4:1D"
  comment = "pethub"
# hostname = "pethub"
}
resource "mikrotik_dhcp_lease" "envisalink" {
  address = "10.0.0.18" #240
  macaddress = "00:1C:2A:02:1F:06"
  comment = "envisalink-alarm-module"
# hostname = "EnvisaLink"
}
resource "mikrotik_dhcp_lease" "midea_ac_1" {
  address = "10.0.4.11"
  macaddress = "C4:39:60:C2:2E:14"
  comment = "midea-ac-1"
}
resource "mikrotik_dhcp_lease" "midea_ac_2" {
  address = "10.0.4.12"
  macaddress = "C4:39:60:BD:5A:54"
  comment = "midea-ac-2"
}
resource "mikrotik_dhcp_lease" "midea_ac_3" {
  address = "10.0.4.13"
  macaddress = "C4:39:60:BD:59:64"
  comment = "midea-ac-3"
}
resource "mikrotik_dhcp_lease" "zigbeegateway" {
  address = "10.0.0.19" 
  macaddress = "A4:CF:12:DC:0B:8C"
  comment = "sonoff-zigbee-gateway"
# hostname   = "tasmota-DC0B8C-2956"
}

# IP Cameras
resource "mikrotik_dhcp_lease" "camera_front" {
  address = "10.0.0.21"
  macaddress = "44:B2:95:61:99:08"
  comment = "camera-front"
# hostname = "D04608317"
}
resource "mikrotik_dhcp_lease" "camera_back" {
  address = "10.0.0.22"
  macaddress = "44:B2:95:61:9D:16"
  comment = "camera-back"
# hostname = "D04608194"
}

### Physical Servers
resource "mikrotik_dhcp_lease" "diskstation" {
  address = "10.0.3.10"
  macaddress = "00:11:32:AC:34:CB"
  comment = "synology-nas"
# hostname = "diskstation"
}

### Virtual Servers
resource "mikrotik_dhcp_lease" "home-assistant" {
  address = "10.0.3.14"
  macaddress = "B6:4A:29:1F:8C:41"
  comment = "home-assistant"
# hostname = "home-assistant"
}
resource "mikrotik_dhcp_lease" "netm" {
  address = "10.0.3.15"
  macaddress = "5A:2C:7E:E5:8E:A4"
  comment = "netm"
# hostname = "netm"
}
resource "mikrotik_dhcp_lease" "cloudbox" {
  address = "10.0.3.20"
  macaddress = "52:AA:A4:13:42:12"
  comment = "cloudbox"
# hostname = "cloudbox"
}
resource "mikrotik_dhcp_lease" "windows-server" {
  address = "10.0.3.21"
  macaddress = "96:5D:29:33:61:BE"
  comment = "windows-server"
# hostname = "WIN-SEAOKHV7CS6"
}
resource "mikrotik_dhcp_lease" "deepstack" {
  address = "10.0.3.22"
  macaddress = "6E:71:A9:F1:0D:99"
  comment = "deepstack"
# hostname = "deepstack"
}
resource "mikrotik_dhcp_lease" "mktxp" {
  address = "10.0.3.23"
  macaddress = "82:21:61:7E:3F:D4"
  comment = "mktxp"
# hostname = "mktxp"
}