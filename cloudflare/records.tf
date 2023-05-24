resource "cloudflare_record" "records" {
  for_each = var.records

  zone_id  = var.zone_id
  name    = each.key
  value   = "heaven.za.net"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "bastion" {
  zone_id  = var.zone_id
  name    = "bastion"
  value   = "heaven.za.net"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "mail" {
  zone_id  = var.zone_id
  name    = "mail"
  value   = "heaven.za.net"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "teamspeak3" {
  zone_id  = var.zone_id
  name    = "teamspeak3"
  value   = "41.185.26.102"
  type    = "A"
  proxied = false
}