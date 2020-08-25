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