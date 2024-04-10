resource "routeros_ip_dns_record" "record" {
  for_each = var.records

  name = "${each.key}.${var.domain}"
  address = each.value
  type    = "A"
  ttl = "15m"
}

resource "routeros_ip_dns_record" "record_local_only" {
  for_each = var.records_local_only

  name = "${each.key}.${var.domain}"
  address = each.value
  type    = "A"
  ttl = "15m"
}

# resource "routeros_ip_dns_record" "bastion" {
#   name = "bastion.${var.domain}"
#   address = "10.0.21.8"
#   ttl = "15m"
# }