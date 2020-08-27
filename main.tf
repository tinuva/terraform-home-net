module "router" {
  source          = "./router"
  
  router_host = var.router_host
  router_user = var.router_user
  router_pass = var.router_pass
  records = var.records
  domain = var.domain
}

module "cloudflare" {
  source          = "./cloudflare"
  
  email = var.cloudflare_email
  api_key = var.cloudflare_api_key
  zone_id = var.cloudflare_zone_id
  records = var.records
}