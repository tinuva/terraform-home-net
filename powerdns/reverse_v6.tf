data "external" "my_reverse_script" {
    for_each = var.records_aaaa

    program = ["bash", "${path.module}/files/reverse_ipv6.sh"]

    query = {
        ipv6 = "${each.value}"
    }
}

# Add a zone
resource "powerdns_zone" "reverse_v6_fd00_colon" {
  name        = "0.0.d.f.ip6.arpa."
  kind        = "Native"
}

# Add PTR for A records to the zone
resource "powerdns_record" "rev_v6_ptr" {
  for_each = data.external.my_reverse_script

  zone    = powerdns_zone.reverse_v6_fd00_colon.name
  name = "${each.value.result.reversed}"
  records    = ["${each.key}.${var.zone}"]
  type    = "PTR"
  ttl     = 30
}