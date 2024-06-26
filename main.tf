module "cloudflare" {
  source = "./dns/cloudflare"

  email         = var.cloudflare_email
  api_key       = var.cloudflare_api_key
  zone_id       = var.cloudflare_zone_id
  records       = var.records
  records_a     = var.records_a
  records_aaaa  = var.records_aaaa
  records_cname = var.records_cname
  hosts         = var.hosts
}

# module "powerdns" {
#   source          = "./dns/powerdns"
#   pdns_server_url = var.pdns_server_url
#   pdns_secret     = var.pdns_secret
# 
#   zone          = var.zone
#   records_a     = var.records_a
#   records_aaaa  = var.records_aaaa
#   records_cname = var.records_cname
# 
#   hosts = var.hosts
# }

module "router" {
  source = "./network/router"

  router_hosturl     = var.router_hosturl
  router_user        = var.router_user
  router_pass        = var.router_pass
  records            = var.records
  domain             = var.domain
  records_local_only = var.records_local_only

  zone          = var.zone
  records_a     = var.records_a
  records_aaaa  = var.records_aaaa
  records_cname = var.records_cname

  ovh = var.ovh

  router_bridge_ports         = var.router_bridge_ports
  bridge_vlans                = var.bridge_vlans
  hosts                       = var.hosts
  non_host_dns                = var.non_host_dns
  ipv4_firewall_filter_rules  = var.ipv4_firewall_filter_rules
  ipv4_firewall_nat_rules     = var.ipv4_firewall_nat_rules
  ipv4_firewall_address_lists = var.ipv4_firewall_address_lists
  ipv6_firewall_filter_rules  = var.ipv6_firewall_filter_rules
  ipv6_firewall_address_lists = var.ipv6_firewall_address_lists

  wireguard_client_oc = var.wireguard_client_oc
}

module "router2" {
  source = "./network/router2"

  router_hosturl     = var.router2_hosturl
  router_user        = var.router_user
  router_pass        = var.router_pass
  records            = var.records
  domain             = var.domain
  records_local_only = var.records_local_only

  ovh = var.ovh

  router_bridge_ports         = var.router2_bridge_ports
  bridge_vlans                = var.bridge_vlans
  hosts                       = var.hosts
  ipv4_firewall_filter_rules  = var.ipv4_firewall_filter_rules
  ipv4_firewall_nat_rules     = var.ipv4_firewall_nat_rules
  ipv4_firewall_address_lists = var.ipv4_firewall_address_lists
  ipv6_firewall_filter_rules  = var.ipv6_firewall_filter_rules
  ipv6_firewall_address_lists = var.ipv6_firewall_address_lists
}

module "switch-main" {
  source = "./network/switch-main"

  switch_hosturl = var.switch_hosturl
  switch_user    = var.switch_user
  switch_pass    = var.switch_pass

  switch_bridge_ports = var.switch_bridge_ports
  bridge_vlans        = var.bridge_vlans
}

# provider "aws" {
#   region     = "us-west-2"
#   access_key = var.aws_access_key_id
#   secret_key = var.aws_secret_access_key
# }
