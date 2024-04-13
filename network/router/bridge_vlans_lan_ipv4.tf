# ipv4 ip address
resource "routeros_ip_address" "vlan-ipv4" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  interface = routeros_vlan.vlan[each.key].name
  address = "10.0.${each.value.vlan}.1/24"
  comment = "${each.key}-${each.value.name}"
}

# ipv4 dhcp pool
resource "routeros_ip_pool" "ipv4-pool" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  name = "${each.key}-${each.value.name}-pool"
  ranges = ["10.0.${each.value.vlan}.100-10.0.${each.value.vlan}.199"]
}

# ipv4 dhcp server network
resource "routeros_ip_dhcp_server_network" "ipv4-dhcp-server-network" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  address = "10.0.${each.value.vlan}.0/24"
  gateway = "10.0.${each.value.vlan}.1"
  dns_server = "10.0.21.1"
  ntp_server = "10.0.${each.value.vlan}.1"
  comment = "${each.key}-${each.value.name}"
}

# ipv4 dhcp server
resource "routeros_ip_dhcp_server" "ipv4-dhcp-server" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  name = "${each.key}-${each.value.name}"
  interface = routeros_vlan.vlan[each.key].name
  address_pool = routeros_ip_pool.ipv4-pool[each.key].name
  lease_time = "2d"
}
