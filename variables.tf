### vlan ports - router2
variable "router2_bridge_ports" {
  description = "Router port config"
  type        = map(object({
    name = string
    tagged_vlans = list(number)
    untagged_vlan = number  # set to 0 if not a bridge vlan port
  }))
  default = {
    "ether1" = {
      name                      = "internet-ftth"
      untagged_vlan             = 0
      tagged_vlans              = []
    }
    "ether4" = {
      name                      = "camera-back"
      untagged_vlan             = 23
      tagged_vlans              = []
    }
    "ether5" = {
      name                      = "ripe-probe"
      untagged_vlan             = 23
      tagged_vlans              = []
    }
    "ether6" = {
      name                      = "braai-room-lan-at-braai"
      untagged_vlan             = 20
      tagged_vlans              = []
    }
    "ether7" = {
      name                      = "lounge-rb750"
      untagged_vlan             = 1
      tagged_vlans              = [20,21,22,23]
    }
    "ether8" = {
      name                      = "office-wifi"
      untagged_vlan             = 21
      tagged_vlans              = [20,22,23]
    }
    "ether9" = {
      name                      = "synology-nas"
      untagged_vlan             = 21
      tagged_vlans              = []
    }
    "ether10" = {
      name                      = "nuc"
      untagged_vlan             = 21
      tagged_vlans              = [20,22]
    }
    "sfp1" = {
      name                      = "uplink"
      untagged_vlan             = 1
      tagged_vlans              = [20,21,22,23,24]
    }
  }
}

### vlan ports - router
variable "router_bridge_ports" {
  description = "Router port config"
  type        = map(object({
    name = string
    tagged_vlans = list(number)
    untagged_vlan = number  # set to 0 if not a bridge vlan port
  }))
  default = {
    "ether1" = {
      name                      = "internet-ftth"
      untagged_vlan             = 0
      tagged_vlans              = []
    }
    "ether2" = {
      name                      = "switch-ether5"
      untagged_vlan             = 1
      tagged_vlans              = [20,21,22,23,24]
    }
    "ether6" = {
      name                      = "braai-room-lan-at-braai"
      untagged_vlan             = 20
      tagged_vlans              = []
    }
    "ether7" = {
      name                      = "lounge-rb750"
      untagged_vlan             = 1
      tagged_vlans              = [20,21,22,23]
    }
    "ether8" = {
      name                      = "office-wifi"
      untagged_vlan             = 21
      tagged_vlans              = [20,22,23]
    }
    "ether9" = {
      name                      = "synology-nas"
      untagged_vlan             = 21
      tagged_vlans              = []
    }
    "ether10" = {
      name                      = "nuc"
      untagged_vlan             = 21
      tagged_vlans              = [20,22]
    }
    "sfp1" = {
      name                      = "switch-dell-back-grg"
      untagged_vlan             = 1
      tagged_vlans              = [20,21,22,23,24]
    }
  }
}

### vlan ports - switch
variable "switch_bridge_ports" {
  description = "Switch Port Config"
  type        = map(object({
    name = string
    tagged_vlans = list(number)
    untagged_vlan = number  # set to 0 if not a bridge vlan port
  }))
  default = {
    "ether2" = {
      name                      = "internet-ftth-to-cpe"
      untagged_vlan             = 10
      tagged_vlans              = []
    }
    "ether3" = {
      name                      = "internet-ftth-to-router"
      untagged_vlan             = 10
      tagged_vlans              = []
    }
    "ether4" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
    "ether5" = {
      name                      = "rtr-rb3011-ether2"
      untagged_vlan             = 1
      tagged_vlans              = [20,21,22,23,24]
    }
    "ether6" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
    "ether7" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
    "ether8" = {
      name                      = "nuc"
      untagged_vlan             = 21
      tagged_vlans              = [20,22]
    }
    "ether9" = {
      name                      = "office-wifi"
      untagged_vlan             = 21
      tagged_vlans              = [20,22,23]
    }
    "ether10" = {
      name                      = "braai-room-lan-at-braai"
      untagged_vlan             = 20
      tagged_vlans              = []
    }
    "ether11" = {
      name                      = "synology-nas"
      untagged_vlan             = 21
      tagged_vlans              = []
    }
    "ether12" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
    "ether13" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
    "ether14" = {
      name                      = "lounge-rb750"
      untagged_vlan             = 1
      tagged_vlans              = [20,21,22,23]
    }
    "ether15" = {
      name                      = "braai-room-wifi"
      untagged_vlan             = 21
      tagged_vlans              = [20,22,23]
    }
    "ether16" = {
      name                      = "offce-rb961"
      untagged_vlan             = 1
      tagged_vlans              = [20,22,23]
    }
    "ether17" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
    "ether18" = {
      name                      = "front-garage-wifi"
      untagged_vlan             = 21
      tagged_vlans              = [20,22,23]
    }
    "ether19" = {
      name                      = "front-garage-camera"
      untagged_vlan             = 23
      tagged_vlans              = []
    }
    "ether20" = {
      name                      = "lte-router"
      untagged_vlan             = 11
      tagged_vlans              = []
    }
    "ether21" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
    "ether22" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
    "ether23" = {
      name                      = "temp-clients"
      untagged_vlan             = 20
      tagged_vlans              = []
    }
    "ether24" = {
      name                      = ""
      untagged_vlan             = 1
      tagged_vlans              = []
    }
  }
}

### vlan mapping
# https://stackoverflow.com/questions/64133145/terraform-iterate-through-map-of-maps-depending-on-value-of-internal-map
variable "bridge_vlans" {
  type        = map(object({
    is_enabled = bool
    name = string
    vlan = number
  }))
  default = {
    vlan01 = {
      is_enabled                = true
      name                      = "mgmt"
      vlan                      = 1
    }
    vlan20 = {
      is_enabled                = true
      name                      = "clients"
      vlan                      = 20
    }
    vlan21 = {
      is_enabled                = true
      name                      = "servers"
      vlan                      = 21
    }
    vlan22 = {
      is_enabled                = true
      name                      = "iot"
      vlan                      = 22
    }
    vlan23 = {
      is_enabled                = true
      name                      = "iot2-lan-only"
      vlan                      = 23
    }
    vlan24 = {
      is_enabled                = true
      name                      = "legacy-wifi"
      vlan                      = 24
    }
  }
}

variable "hosts" {
  description = "Lan hosts config"
  default = {
    "dev" = {
      mac_addr             = "72:73:A7:53:5A:CE"
      vlan                 = 21
      ip_suffix            = 5
    }
  }
}

variable "adguard_host" { }
variable "adguard_user" { }
variable "adguard_pass" { }

variable "router_host" { }
variable "router_hosturl" { }
variable "router2_host" { }
variable "router2_hosturl" { }
variable "router_user" { }
variable "router_pass" { }

variable "switch_hosturl" { }
variable "switch_user" { }
variable "switch_pass" { }

variable "cloudflare_api_key" { }
variable "cloudflare_email" { }
variable "cloudflare_zone_id" { }

variable "domain" {}
variable "records" { }
variable "records_local_only" { }
variable "recordsv6_local_only" { }
variable "records_local_only_adguard" { }

variable "zone" { }
variable "records_a" { }
variable "records_aaaa" { }
variable "records_cname" { }

variable "pdns_server_url" { }
variable "pdns_secret" { }

variable "aws_access_key_id" { }
variable "aws_secret_access_key" { }

variable "ovh" { }
