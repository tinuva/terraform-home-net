# resource "routeros_ip_dns_record" "record" {
#   for_each = var.records
# 
#   name = "${each.key}.${var.domain}"
#   address = each.value
#   type    = "A"
#   ttl = "15m"
# }

#resource "routeros_ip_dns_record" "record_local_only" {
#  for_each = var.records_local_only
#
#  name = "${each.key}.${var.domain}"
#  address = each.value
#  type    = "A"
#  ttl = "15m"
#}

# resource "routeros_ip_dns_record" "bastion" {
#   name = "bastion.${var.domain}"
#   address = "10.0.21.8"
#   ttl = "15m"
# }


# Add A records to the zone
resource "routeros_ip_dns_record" "lanarecord" {
  for_each = var.records_a

  name    = "${each.key}.${var.zone}"
  type    = "A"
  ttl     = "30s"
  address = each.value
}

# Add AAAA records to the zone
resource "routeros_dns_record" "lanaaaarecord" {
  for_each = var.records_aaaa

  name    = "${each.key}.${var.zone}"
  type    = "AAAA"
  ttl     = "30s"
  address = each.value
}

# Add CNAME records to the zone
resource "routeros_dns_record" "lancnamerecord" {
  for_each = var.records_cname

  name    = "${each.key}.${var.zone}"
  type    = "CNAME"
  ttl     = "30s"
  cname = "${each.value}.${var.zone}"
}

# Add A records to the zone for hosts
resource "routeros_ip_dns_record" "lanhostarecord" {
  for_each = var.hosts

  name    = "${each.key}.${var.zone}"
  type    = "A"
  ttl     = "30s"
  address = "10.0.${each.value.vlan}.${each.value.ip_suffix}"
}

# Add AAAA records to the zone for hosts
resource "routeros_dns_record" "lanhostaaaarecord" {
  for_each = var.hosts

  name    = "${each.key}.${var.zone}"
  type    = "AAAA"
  ttl     = "30s"
  address = "fd00:${each.value.vlan}::7073:a7ff:fe${element(split(":", lower(each.value.mac_addr)), 3)}:${element(split(":", lower(each.value.mac_addr)), 4)}${element(split(":", lower(each.value.mac_addr)), 5)}"
}