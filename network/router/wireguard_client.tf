resource "routeros_interface_wireguard" "oracle_wg_interface" {
  name        = var.wireguard_client_oc.oracle_instance1.interface_name
  listen_port = var.wireguard_client_oc.oracle_instance1.interface_listen_port
  private_key        = var.wireguard_client_oc.oracle_instance1.interface_private_key
  mtu        = var.wireguard_client_oc.oracle_instance1.interface_mtu
}

resource "routeros_interface_wireguard_peer" "oracle_wg_peer" {
  interface  = routeros_interface_wireguard.oracle_wg_interface.name
  public_key = var.wireguard_client_oc.oracle_instance1.peer_public_key
  allowed_address = var.wireguard_client_oc.oracle_instance1.peer_allowedips
  endpoint_address = var.wireguard_client_oc.oracle_instance1.peer_endpoint_address
  endpoint_port = var.wireguard_client_oc.oracle_instance1.peer_endpoint_port
  preshared_key = var.wireguard_client_oc.oracle_instance1.peer_presharedkey
  private_key = ""
}

resource "routeros_ip_address" "oracle_wg_peer_v4" {
  interface = routeros_interface_wireguard.oracle_wg_interface.name
  address = var.wireguard_client_oc.oracle_instance1.interface_address_v4
}

resource "routeros_ipv6_address" "oracle_wg_peer_v6" {
  interface = routeros_interface_wireguard.oracle_wg_interface.name
  address = var.wireguard_client_oc.oracle_instance1.interface_address_v6
  advertise = false
}