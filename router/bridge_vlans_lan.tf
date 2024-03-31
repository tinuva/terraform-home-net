

# create vlans
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_bridge_vlan
resource "routeros_interface_bridge_vlan" "bridge_vlan" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  vlan_ids = each.value.vlan
  bridge    = routeros_interface_bridge.bridge.name
  untagged  = [for port, detail in var.router_bridge_ports: port if detail.untagged_vlan == each.value.vlan ]
  tagged    = concat(["bridge"], [for port, detail in var.router_bridge_ports: port if contains(detail.tagged_vlans, each.value.vlan) ])
  comment = "${each.key}-${each.value.name}"
}

# create layer3 vlan interface to add ip addresses to
resource "routeros_vlan" "vlan" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  interface = routeros_interface_bridge.bridge.name
  name = "${each.key}-${each.value.name}"
  vlan_id = each.value.vlan
  comment = "${each.key}-${each.value.name}"
}

# add interface to "lan" interface list
resource "routeros_interface_list" "lan" {
  name = "LAN"
}

resource "routeros_interface_list_member" "lan-vlan" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  interface = routeros_vlan.vlan[each.key].name
  list      = routeros_interface_list.lan.name
}

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

# ipv6 ip address - private
resource "routeros_ipv6_address" "vlan-ipv6-private" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  interface = routeros_vlan.vlan[each.key].name
  address = "fd00:${each.value.vlan}::/64"
  comment = "${each.key}-${each.value.name}"
  advertise = true
}

# ipv6 ip address - public
resource "routeros_ipv6_address" "vlan-ipv6-public" {
  for_each = {
    for key, val in var.bridge_vlans :
      key => val if val.is_enabled
  }

  interface = routeros_vlan.vlan[each.key].name
  from_pool = "ipv6-pool"
  comment = "${each.key}-${each.value.name}"
  advertise = true
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
  dns_server = "10.0.21.2"
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
