# Configure the mikrotik Provider
provider "mikrotik" {
  host = var.router_host
  username = var.router_user
  password = var.router_pass
}

# import mikrotik Provider
terraform {
  required_providers {
    mikrotik = {
      source = "ddelnano/mikrotik"
    }
  }
}