# manage a DNS rewrite rule
# resource "adguard_rewrite" "pethub" {
#   domain = "hub.api.surehub.io"
#   answer = "10.0.0.16"
# }

# resource "adguard_rewrite" "adguard_records_local_only" {
#   for_each = var.records_local_only
# 
#   domain = "${each.key}.${var.domain}"
#   answer = each.value
# 
# #  lifecycle {
# #    ignore_changes = [
# #      last_updated,
# #    ]
# #  }
# }
# 
# resource "adguard_rewrite" "records_local_only_adguard" {
#   for_each = var.records_local_only_adguard
# 
#   domain = "${each.key}.${var.domain}"
#   answer = each.value
# 
# #  lifecycle {
# #    ignore_changes = [
# #      last_updated,
# #    ]
# #  }
# }
# 
# resource "adguard_rewrite" "adguard_recordsv6_local_only" {
#   for_each = var.recordsv6_local_only
# 
#   domain = "${each.key}.${var.domain}"
#   answer = each.value
# 
# #  lifecycle {
# #    ignore_changes = [
# #      last_updated,
# #    ]
# #  }
# }
# 