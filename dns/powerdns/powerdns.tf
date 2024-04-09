# configuration for the provider
provider "powerdns" {
  server_url = var.pdns_server_url  # or use PDNS_SERVER_URL variable
  api_key    = var.pdns_secret      # or use PDNS_API_KEY variable
}

# import providers
terraform {
  required_providers {
    powerdns = {
      source = "pan-net/powerdns"
    }
  }
}
