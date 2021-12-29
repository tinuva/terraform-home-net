# Laptops
resource "mikrotik_dhcp_lease" "laptop_david_work_lan" {
  address = "10.0.0.40"
  macaddress = "98:FC:84:E8:3E:52"
  comment = "laptop-david-work-lan"
  hostname = "909c4ace21ef"
}
resource "mikrotik_dhcp_lease" "laptop_david_work_wifi" {
  address = "10.0.0.41"
  macaddress = "90:9C:4A:CE:21:EF"
  comment = "laptop-david-work-wifi"
  hostname = "909c4ace21ef"
}
resource "mikrotik_dhcp_lease" "laptop_karen_work" {
  address = "10.0.0.42"
  macaddress = "88:E9:FE:88:AB:FE"
  comment = "laptop-karen-work"
  hostname = "88e9fe88abfe"
}

# Network services
resource "mikrotik_dhcp_lease" "diskstation" {
  address = "10.0.0.10" #182
  macaddress = "00:11:32:AC:34:CB"
  comment = "synology-nas"
  hostname = "diskstation"
}
resource "mikrotik_dhcp_lease" "turbot" {
  address = "10.0.0.11" #234
  macaddress = "00:08:A2:0D:8D:F1"
  comment = "minnowboard-turbot-1"
  #hostname = "turbot"
}
resource "mikrotik_dhcp_lease" "trex" {
  address = "10.0.0.12" #235
  macaddress = "00:08:A2:0D:8E:FE"
  comment = "minnowboard-turbot-2"
  hostname = "trex"
}
resource "mikrotik_dhcp_lease" "home-assistant" {
  address = "10.0.0.14" #235
  macaddress = "B6:4A:29:1F:8C:41"
  comment = "home-assistant"
  hostname = "home-assistant"
}
resource "mikrotik_dhcp_lease" "netm" {
  address = "10.0.0.15" #235
  macaddress = "5A:2C:7E:E5:8E:A4"
  comment = "netm"
  hostname = "netm"
}

resource "mikrotik_dhcp_lease" "envisalink" {
  address = "10.0.0.18" #240
  macaddress = "00:1C:2A:02:1F:06"
  comment = "envisalink-alarm-module"
  hostname = "EnvisaLink"
}
resource "mikrotik_dhcp_lease" "zigbeegateway" {
  address = "10.0.0.19" 
  macaddress = "A4:CF:12:DC:0B:8C"
  comment = "sonoff-zigbee-gateway"
  hostname   = "tasmota-zbbridge-2956"
}

# IP Cameras
resource "mikrotik_dhcp_lease" "camera_front" {
  address = "10.0.0.21"
  macaddress = "44:B2:95:61:99:08"
  comment = "camera-front"
  hostname = "D04608317"
}
resource "mikrotik_dhcp_lease" "camera_back" {
  address = "10.0.0.22"
  macaddress = "44:B2:95:61:9D:16"
  comment = "camera-back"
  hostname = "D04608194"
}

resource "mikrotik_dhcp_lease" "midea_ac_1" {
  address = "10.0.0.51"
  macaddress = "C4:39:60:C2:2E:14"
  comment = "midea-ac-1"
}

resource "mikrotik_dhcp_lease" "midea_ac_2" {
  address = "10.0.0.52"
  macaddress = "C4:39:60:BD:5A:54"
  comment = "midea-ac-2"
}

resource "mikrotik_dhcp_lease" "midea_ac_3" {
  address = "10.0.0.53"
  macaddress = "C4:39:60:BD:59:64"
  comment = "midea-ac-3"
}

resource "mikrotik_dhcp_lease" "cbi_tuya_maingeyser" {
  address = "10.0.0.55"
  macaddress = "68:57:2D:D2:FE:D2"
  comment = "cbi_tuya_maingeyser"
  hostname = "TY_WR"
}
resource "mikrotik_dhcp_lease" "cbi_tuya_frontgeyser" {
  address = "10.0.0.56"
  macaddress = "68:57:2D:D2:F5:C7"
  comment = "cbi_tuya_frontgeyser"
  hostname = "TY_WR"
}

resource "mikrotik_dhcp_lease" "goodwe_inverter" {
  address = "10.0.0.59"
  macaddress = "98:D8:63:80:30:64"
  comment = "goodwe-inverter"
  hostname = "HF-LPB100"
}
