# data "aws_ip_ranges" "aws_eu_central_1_ec2" {
#   regions  = ["eu-central-1"]
#   services = ["ec2"]
# }
# 
# resource "routeros_firewall_addr_list" "aws_eu_central_1_ec2_v4_list" {
#   for_each = toset(data.aws_ip_ranges.aws_eu_central_1_ec2.cidr_blocks)
# 
#   address = each.key
#   list = "aws_eu_central_1_ec2"
# }
# 
# data "aws_ip_ranges" "aws_eu_central_1_cf" {
#   regions  = ["eu-central-1"]
#   services = ["cloudfront"]
# }
# 
# resource "routeros_firewall_addr_list" "aws_eu_central_1_cf_v4_list" {
#   for_each = toset(data.aws_ip_ranges.aws_eu_central_1_cf.cidr_blocks)
# 
#   address = each.key
#   list = "aws_eu_central_1_cf"
# }
# 
# data "aws_ip_ranges" "aws_global_cf" {
#   regions  = ["global"]
#   services = ["cloudfront"]
# }
# 
# resource "routeros_firewall_addr_list" "aws_global_cf_v4_list" {
#   for_each = toset(data.aws_ip_ranges.aws_global_cf.cidr_blocks)
# 
#   address = each.key
#   list = "aws_eu_global_cf"
# }
# 
# resource "routeros_firewall_addr_list" "ovh" {
#   for_each = var.ovh
# 
#   address = each.key
#   list = "ovh"
# }