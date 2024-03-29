variable "adguard_host" { default = "192.168.88.1:8728" }
variable "adguard_user" { default = "admin" }
variable "adguard_pass" { default = "" }

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

variable "records_local_only_adguard" {
    description = "Map dns to hosts"
    default = {
        "host1" = "192.168.88.81"
        "host2" = "192.168.88.82"
        "host3" = "192.168.88.83"
    }
}

variable "recordsv6_local_only" {
    description = "Map dns to hosts"
    default = {
        "host1" = "fd00::1"
        "host2" = "fd00::1"
        "host3" = "fd00::1"
    }
}