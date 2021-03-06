resource "mikrotik_dns_record" "record" {
  for_each = var.records

  name = "${each.key}.${var.domain}"
  address = each.value
  ttl = 900
}

resource "mikrotik_dns_record" "bastion" {
  name = "bastion.${var.domain}"
  address = "192.168.241.11"
  ttl = 900
}