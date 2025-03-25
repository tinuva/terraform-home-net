# Add A records to the zone for hosts
resource "cloudflare_record" "lanhostrecord" {
  for_each = var.hosts

  zone_id  = var.zone_id
  name    = each.key
  type    = "CNAME"
  content   = "heaven.za.net"
  proxied = each.value.cf_proxied
  ttl = 1
}

# resource "cloudflare_record" "records" {
#   for_each = var.records_a
# 
#   zone_id  = var.zone_id
#   name    = each.key
#   content   = "heaven.za.net"
#   type    = "CNAME"
#   proxied = true
#   ttl = 1
# }

resource "cloudflare_record" "cname_records" {
  #for_each = var.records_cname
  for_each = { for key, value in var.records_cname : key => value if value.cf_enabled }

  zone_id  = var.zone_id
  name    = each.key
  content   = "heaven.za.net"
  type    = "CNAME"
  proxied = true
  ttl = 1
}

# resource "cloudflare_record" "bastion" {
#   zone_id  = var.zone_id
#   name    = "bastion"
#   content   = "heaven.za.net"
#   type    = "CNAME"
#   proxied = false
#  ttl = 1
# }

resource "cloudflare_record" "teamspeak3" {
  zone_id  = var.zone_id
  name    = "teamspeak3"
  content   = "41.185.26.102"
  type    = "A"
  proxied = false
  ttl = 1
}
