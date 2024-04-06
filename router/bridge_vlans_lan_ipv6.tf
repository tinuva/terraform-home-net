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
