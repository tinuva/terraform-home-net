# Laptops
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

# Network services
resource "mikrotik_dhcp_lease" "diskstation" {
  address = "192.168.241.10" #182
  macaddress = "00:11:32:AC:34:CB"
  comment = "synology-nas"
  hostname = "diskstation"
}
resource "mikrotik_dhcp_lease" "turbot" {
  address = "192.168.241.11" #234
  macaddress = "00:08:A2:0D:8D:F1"
  comment = "minnowboard-turbot-1"
  hostname = "turbot"
}
resource "mikrotik_dhcp_lease" "trex" {
  address = "192.168.241.12" #235
  macaddress = "00:08:A2:0D:8E:FE"
  comment = "minnowboard-turbot-2"
  hostname = "trex"
}
resource "mikrotik_dhcp_lease" "envisalink" {
  address = "192.168.241.18" #240
  macaddress = "00:1C:2A:02:1F:06"
  comment = "envisalink-alarm-module"
  hostname = "EnvisaLink"
}
resource "mikrotik_dhcp_lease" "zigbeegateway" {
  address = "192.168.241.19" 
  macaddress = "A4:CF:12:DC:0B:8C"
  comment = "sonoff-zigbee-gateway"
  hostname   = "tasmota_zbbridge-2956"
}

# IP Cameras
resource "mikrotik_dhcp_lease" "camera_front" {
  address = "192.168.241.21"
  macaddress = "44:B2:95:61:99:08"
  comment = "camera-front"
  hostname = "D04608317"
}
resource "mikrotik_dhcp_lease" "camera_back" {
  address = "192.168.241.22"
  macaddress = "44:B2:95:61:9D:16"
  comment = "camera-back"
  hostname = "D04608194"
}
