# configure the routeros provider
provider "routeros" {
  hosturl = var.switch_hosturl
  username = var.switch_user
  password = var.switch_pass
  # ca_certificate = "/path/to/ca/certificate.pem"  # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                           # env ROS_INSECURE or MIKROTIK_INSECURE
}

# import providers
terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
  }
}