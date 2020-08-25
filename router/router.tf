# import mikrotik Provider
terraform {
  required_providers {
    mikrotik = {
      source = "ddelnano/mikrotik"
    }
  }
}

# Configure the mikrotik Provider
provider "mikrotik" {
  host = var.router_host
  username = var.router_user
  password = var.router_pass
}

#resource "mikrotik_dhcp_lease" "file_server" {
#  address = "192.168.88.1"
#  macaddress = "11:22:33:44:55:66"
#  comment = "file server"
#}

#resource "mikrotik_dns_record" "record" {
#  name = "dns.heaven.za.net"
#  address = "192.168.241.2"
#  ttl = 300
#}

resource "mikrotik_script" "script" {
  name = "test-script"
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
  source = file("${path.module}/script-test.rsc")
}

resource "mikrotik_scheduler" "scheduler" {
  name = "test-scheduler"
  on_event = "test-script"
  # Run every 5 mins
  interval = 300
}