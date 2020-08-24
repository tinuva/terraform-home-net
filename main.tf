module "router" {
  source          = "./router"
  
  router_host = var.router_host
  router_user = var.router_user
  router_pass = var.router_pass
}