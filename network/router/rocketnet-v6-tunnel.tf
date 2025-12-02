resource "routeros_ipv6_dhcp_client" "inet_provider" {
  pool_name         = "ipv6-pool"
  interface         = "l2tp-rocket-v6"
  add_default_route = true
  pool_prefix_length = 48
  request   = ["prefix"]
  use_peer_dns = false
  disabled  = false
}
