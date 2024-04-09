variable "api_key" { }
variable "email" { }
variable "zone_id" { }
variable "records" {
    description = "Map dns to hosts"
    default = {
        "host1" = "192.168.88.81"
        "host2" = "192.168.88.82"
        "host3" = "192.168.88.83"
    }
}