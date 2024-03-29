# Add a zone
resource "powerdns_zone" "lanzone" {
  name        = var.zone
  kind        = "Native"
  nameservers = ["hal.ns.cloudflare.com.", "meera.ns.cloudflare.com."]
}

# Add A records to the zone
resource "powerdns_record" "lanarecord" {
  for_each = var.records_a

  zone    = powerdns_zone.lanzone.name
  name    = "${each.key}.${var.zone}"
  type    = "A"
  ttl     = 30
  records = [each.value]
}

# Add AAAA records to the zone
resource "powerdns_record" "lanaaaarecord" {
  for_each = var.records_aaaa

  zone    = powerdns_zone.lanzone.name
  name    = "${each.key}.${var.zone}"
  type    = "AAAA"
  ttl     = 30
  records = [each.value]
}

# Add CNAME records to the zone
resource "powerdns_record" "lancnamerecord" {
  for_each = var.records_cname

  zone    = powerdns_zone.lanzone.name
  name    = "${each.key}.${var.zone}"
  type    = "CNAME"
  ttl     = 30
  records = ["${each.value}.${var.zone}"]
}
