variable "router_host" { default = "192.168.88.1:8728" }
variable "router_hosturl" { default = "https://192.168.88.1:443" }
variable "router_user" { default = "admin" }
variable "router_pass" { default = "" }

variable "domain" {}

variable "records" {
    description = "Map dns to hosts"
    default = {
        "host1" = "192.168.88.81"
        "host2" = "192.168.88.82"
        "host3" = "192.168.88.83"
    }
}

variable "records_local_only" {
    description = "Map dns to hosts"
    default = {
        "host1" = "192.168.88.81"
        "host2" = "192.168.88.82"
        "host3" = "192.168.88.83"
    }
}