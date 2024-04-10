### If no internet ping release/renew dhcp client - Vumatel connectivity issue workaround
resource "routeros_system_script" "check-internet-script" {
  name = "check-internet"
  #owner = "admin"
  policy = [
    "ftp",
    "reboot",
    "read",
    "write",
    "policy",
    "test",
    "password",
    "sniff",
    "sensitive",
  ]
  source = file("${path.module}/scripts/check-internet.rsc")
}

resource "routeros_system_scheduler" "check-internet-schedule" {
  name = "check-internet-schedule"
  on_event = "check-internet"
  # Run every 1 min
  interval = "1m"
}

### check upnp enabled script
resource "routeros_system_script" "check-upnp-script" {
  name = "check-upnp"
  #owner = "admin"
  policy = [
    "ftp",
    "reboot",
    "read",
    "write",
    "policy",
    "test",
    "password",
    "sniff",
    "sensitive",
  ]
  source = file("${path.module}/scripts/check-upnp.rsc")
}

resource "routeros_system_scheduler" "check-upnp-schedule" {
  name = "check-upnp-schedule"
  on_event = "check-upnp"
  # Run every 60 mins
  interval = "1h"
}


### check vrrp enabled script
resource "routeros_system_script" "vrrp-script" {
  name = "check-vrrp"
  #owner = "admin"
  policy = [
    "ftp",
    "reboot",
    "read",
    "write",
    "policy",
    "test",
    "password",
    "sniff",
    "sensitive",
  ]
  source = file("${path.module}/scripts/check-vrrp.rsc")
}

resource "routeros_system_scheduler" "vrrp-schedule" {
  name = "vrrp-schedule"
  on_event = "check-vrrp"
  # Run every 60 mins
  interval = "1h"
}

### CloudFlare ip list update scripts
resource "routeros_system_script" "fw-ip-list-update-cloudflare-script" {
  name = "fw-ip-list-update-cloudflare"
  #owner = "admin"
  policy = [
    "ftp",
    "reboot",
    "read",
    "write",
    "policy",
    "test",
    "password",
    "sniff",
    "sensitive",
  ]
  source = file("${path.module}/scripts/fw-ip-list-update-cloudflare.rsc")
}
resource "routeros_system_scheduler" "fw-ip-list-update-cloudflare-schedule" {
  name = "fw-ip-list-update-cloudflare"
  on_event = "fw-ip-list-update-cloudflare"
  # Run every almost 24h
  interval = "23h59m59s"
}