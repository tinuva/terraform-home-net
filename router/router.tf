# configure the mikrotik provider
provider "mikrotik" {
  host = var.router_host
  username = var.router_user
  password = var.router_pass
}

# configure the routeros provider
provider "routeros" {
  hosturl = var.router_hosturl
  username = var.router_user
  password = var.router_pass
  # ca_certificate = "/path/to/ca/certificate.pem"  # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                           # env ROS_INSECURE or MIKROTIK_INSECURE
}

# import providers
terraform {
  required_providers {
    mikrotik = {
      source = "ddelnano/mikrotik"
    }
    routeros = {
      source = "vaerh/routeros"
    }
  }
}