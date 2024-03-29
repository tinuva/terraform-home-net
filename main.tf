# module "adguard" {
#   source          = "./adguard"
#   
#   adguard_host = var.adguard_host
#   adguard_user = var.adguard_user
#   adguard_pass = var.adguard_pass
# 
#   domain = var.domain
#   records_local_only = var.records_local_only
#   records_local_only_adguard = var.records_local_only_adguard
#   recordsv6_local_only = var.recordsv6_local_only
# }

module "powerdns" {
  source          = "./powerdns"
  pdns_server_url = var.pdns_server_url
  pdns_secret    = var.pdns_secret

  zone = var.zone
  records_a = var.records_a
  records_aaaa = var.records_aaaa
  records_cname = var.records_cname
}

module "router" {
  source          = "./router"
  
  router_host = var.router_host
  router_hosturl = var.router_hosturl
  router_user = var.router_user
  router_pass = var.router_pass
  records = var.records
  domain = var.domain
  records_local_only = var.records_local_only

  ovh = var.ovh

  router_bridge_ports = var.router_bridge_ports
  bridge_vlans = var.bridge_vlans
}

module "switch-main" {
  source          = "./network/switch-main"
  
  switch_hosturl = var.switch_hosturl
  switch_user = var.switch_user
  switch_pass = var.switch_pass

  switch_bridge_ports = var.switch_bridge_ports
  bridge_vlans = var.bridge_vlans
}

module "cloudflare" {
  source          = "./cloudflare"
  
  email = var.cloudflare_email
  api_key = var.cloudflare_api_key
  zone_id = var.cloudflare_zone_id
  records = var.records
}

# provider "aws" {
#   region     = "us-west-2"
#   access_key = var.aws_access_key_id
#   secret_key = var.aws_secret_access_key
# }
