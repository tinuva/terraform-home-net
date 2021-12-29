resource "mikrotik_dns_record" "record" {
  for_each = var.records

  name = "${each.key}.${var.domain}"
  address = each.value
  ttl = 900
}

resource "mikrotik_dns_record" "bastion" {
  name = "bastion.${var.domain}"
  address = "10.0.0.13"
  ttl = 900
}