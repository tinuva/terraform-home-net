### DHCP to DNS
resource "mikrotik_script" "dhcp-to-dns-script" {
  name = "dhcp-dns"
  owner = "admin"
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
  source = file("${path.module}/dhcp-dns.rsc")
}

resource "mikrotik_scheduler" "dhcp-dns-schedule" {
  name = "dhcp-dns-schedule"
  on_event = "dhcp-dns"
  # Run every 15 mins
  interval = 900
}

### Firewall NAT
resource "mikrotik_script" "firewall-nat-script" {
  name = "firewall-nat"
  owner = "admin"
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
  source = file("${path.module}/firewall-nat.rsc")
}

resource "mikrotik_scheduler" "firewall-nat-schedule" {
  name = "firewall-nat-schedule"
  on_event = "firewall-nat"
  # Run every 60 mins
  interval = 3600
}

### Firewall filter
resource "mikrotik_script" "firewall-filter-script" {
  name = "firewall-filter"
  owner = "admin"
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
  source = file("${path.module}/firewall-filter.rsc")
}

resource "mikrotik_scheduler" "firewall-filter-schedule" {
  name = "firewall-filter-schedule"
  on_event = "firewall-filter"
  # Run every 60 mins
  interval = 3600
}

### DHCP Server settings
resource "mikrotik_script" "dhcp-server-script" {
  name = "dhcp-server"
  owner = "admin"
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
  source = file("${path.module}/dhcp-server.rsc")
}

resource "mikrotik_scheduler" "dhcp-server-schedule" {
  name = "dhcp-server-schedule"
  on_event = "dhcp-server"
  # Run every 60 mins
  interval = 3600
}

### If no internet ping release/renew dhcp client - Vumatel connectivity issue workaround
resource "mikrotik_script" "check-internet-script" {
  name = "check-internet"
  owner = "admin"
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
  source = file("${path.module}/check-internet.rsc")
}

resource "mikrotik_scheduler" "check-internet-schedule" {
  name = "check-internet-schedule"
  on_event = "check-internet"
  # Run every 1 min
  interval = 60
}

### check upnp enabled script
resource "mikrotik_script" "check-upnp-script" {
  name = "check-upnp"
  owner = "admin"
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
  source = file("${path.module}/check-upnp.rsc")
}

resource "mikrotik_scheduler" "check-upnp-schedule" {
  name = "check-upnp-schedule"
  on_event = "check-upnp"
  # Run every 60 mins
  interval = 3600
}


### check upnp enabled script
resource "mikrotik_script" "vrrp-script" {
  name = "check-vrrp"
  owner = "admin"
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
  source = file("${path.module}/check-vrrp.rsc")
}

resource "mikrotik_scheduler" "vrrp-schedule" {
  name = "vrrp-schedule"
  on_event = "check-vrrp"
  # Run every 60 mins
  interval = 3600
}

### CloudFlare ip list update scripts
resource "mikrotik_script" "fw-ip-list-update-cloudflare-script" {
  name = "fw-ip-list-update-cloudflare"
  owner = "admin"
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
  source = file("${path.module}/fw-ip-list-update-cloudflare.rsc")
}
resource "mikrotik_scheduler" "fw-ip-list-update-cloudflare-schedule" {
  name = "fw-ip-list-update-cloudflare"
  on_event = "fw-ip-list-update-cloudflare"
  # Run every almost 24h
  interval = 86399
}