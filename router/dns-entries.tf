resource "mikrotik_dns_record" "record" {
  for_each = var.records

  name = "${each.key}.${var.domain}"
  address = each.value
  ttl = 300
}