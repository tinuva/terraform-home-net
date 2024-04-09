data "external" "my_reverse_script" {
    for_each = var.records_aaaa

    program = ["bash", "${path.module}/files/reverse_ipv6.sh"]

    query = {
        ipv6 = "${each.value}"
    }
}

data "external" "my_reverse_script_with_hosts" {
    for_each = var.hosts

    program = ["bash", "${path.module}/files/reverse_ipv6.sh"]

    query = {
        ipv6 = "fd00:${each.value.vlan}::7073:a7ff:fe${element(split(":", lower(each.value.mac_addr)), 3)}:${element(split(":", lower(each.value.mac_addr)), 4)}${element(split(":", lower(each.value.mac_addr)), 5)}"
    }
}

# Add a zone
resource "powerdns_zone" "reverse_v6_fd00_colon" {
  name        = "0.0.d.f.ip6.arpa."
  kind        = "Native"
}

# Add PTR for AAAA records to the zone
resource "powerdns_record" "rev_v6_ptr" {
  for_each = data.external.my_reverse_script

  zone    = powerdns_zone.reverse_v6_fd00_colon.name
  name = "${each.value.result.reversed}"
  records    = ["${each.key}.${var.zone}"]
  type    = "PTR"
  ttl     = 30
}

# Add PTR for AAAA records to the zone for hosts
resource "powerdns_record" "host_rev_v6_ptr" {
  for_each = data.external.my_reverse_script_with_hosts

  zone    = powerdns_zone.reverse_v6_fd00_colon.name
  name = "${each.value.result.reversed}"
  records    = ["${each.key}.${var.zone}"]
  type    = "PTR"
  ttl     = 30
}