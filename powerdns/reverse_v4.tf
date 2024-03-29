# Add a zone
resource "powerdns_zone" "reverse_v4_10_dot" {
  name        = "10.in-addr.arpa."
  kind        = "Native"
}

# Add PTR for A records to the zone
resource "powerdns_record" "rev_v4_ptr" {
  for_each = var.records_a

  zone    = powerdns_zone.reverse_v4_10_dot.name
  name = "${format(
    "%s.%s.%s.%s.in-addr.arpa.",
      element( split(".", "${each.value}") ,3),
      element( split(".", "${each.value}") ,2),
      element( split(".", "${each.value}") ,1),
      element( split(".", "${each.value}") ,0),
    )
  }"
  records    = ["${each.key}.${var.zone}"]
  type    = "PTR"
  ttl     = 30
}