resource "cloudflare_record" "records" {
  for_each = var.records

  zone_id  = var.zone_id
  name    = each.key
  value   = "heaven.za.net"
  type    = "CNAME"
  proxied = false
}