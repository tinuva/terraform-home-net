### vlan ports - router
variable "router_bridge_ports" {
    description = "Map ports to bridge on router and set native vlan"
    default = {
        "ether2" = "1"     # switch
        #"ether3" = "1"     # switch
        #"ether4" = "1"     #
        #"ether5" = "1"     # 
        "ether6" = "20"     # braai lan
        "ether7" = "1"     # lounge rb750
        "ether8" = "21"     # Office wifi
        "ether9" = "21"     # Synology NAS
        "ether10" = "21"    # NUC
        "sfp1" = "1"       # Dell Switch
    }
}

### vlan ports - switch
variable "switch_bridge_ports" {
    description = "Map ports to bridge on router and set native vlan"
    default = {
        "ether2" = "10"    # Internet FTTH CPE
        "ether3" = "10"    # Internet FTTH to Router
        "ether4" = "1"    # 
        "ether5" = "1"    # switch
        "ether6" = "1"    #  
        "ether7" = "21"    # 
        "ether8" = "21"    # NUC
        "ether9" = "21"    # office wifi with poe injector
        "ether10" = "20"   # braai room lan at braai
        "ether11" = "21"   # Synology NAS
        "ether12" = "1"    # printer
        "ether13" = "10"   # lounge vumatel ont
        "ether14" = "1"    # lounge rb750
        "ether15" = "21"   # braai room wifi
        "ether16" = "1"    # offce rb961 
        "ether17" = "1"    # braai lan offline
        "ether18" = "21"   # ??? blue --> front garage wifi
        "ether19" = "23"   # front garage camera
        "ether20" = "11"   # LTE router
        "ether21" = "1"    # surepet hub
        "ether22" = "1"
        "ether23" = "22"
        "ether24" = "1"
        # "sfp1" = "1"
        # "sfp2" = "1"
        # "sfp3" = "1"
        # "sfp4" = "1"
    }
}

### vlan mapping
# https://stackoverflow.com/questions/64133145/terraform-iterate-through-map-of-maps-depending-on-value-of-internal-map
variable "bridge_vlans" {
  type        = map(object({
    is_enabled = bool
    name = string
    vlan = number
    router_ports_untagged = list(string)
    router_ports_tagged = list(string)
    switch_ports_untagged = list(string)
    switch_ports_tagged = list(string)
  }))
  default = {
    vlan01 = {
      is_enabled                = true
      name                      = "mgmt"
      vlan                      = 1
      router_ports_untagged     = ["ether2", "ether6", "ether7", "sfp1"]
      router_ports_tagged       = []
      switch_ports_untagged     = [
        "ether4", "ether5", "ether6", "ether12",
        "ether14", "ether16", "ether17", "ether21", "ether22", "ether24"
      ]
      switch_ports_tagged       = []
    }
    vlan20 = {
      is_enabled                = true
      name                      = "clients"
      vlan                      = 20
      router_ports_untagged     = ["ether6"]
      router_ports_tagged       = ["ether2", "ether7", "ether8", "ether9", "ether10", "sfp1"]
      switch_ports_untagged     = ["ether10"]
      switch_ports_tagged       = ["ether2", "ether3", "ether5", "ether8", "ether9", "ether14", "ether15", "ether16", "ether18", "ether22", "ether24"]
    }
    vlan21 = {
      is_enabled                = true
      name                      = "servers"
      vlan                      = 21
      router_ports_untagged     = []
      router_ports_tagged       = ["ether2", "ether6", "ether7", "sfp1"]
      switch_ports_untagged     = ["ether7", "ether8", "ether9", "ether11", "ether15", "ether18"]
      switch_ports_tagged       = ["ether2", "ether3", "ether5", "ether14", "ether22", "ether24"]
    }
    vlan22 = {
      is_enabled                = true
      name                      = "iot"
      vlan                      = 22
      router_ports_untagged     = []
      router_ports_tagged       = ["ether2", "ether6", "ether7", "ether8", "ether9", "ether10", "sfp1"]
      switch_ports_untagged     = ["ether23"]
      switch_ports_tagged       = ["ether2", "ether3", "ether5", "ether8", "ether9", "ether14", "ether15", "ether16", "ether18", "ether22", "ether24"]
    }
    vlan23 = {
      is_enabled                = true
      name                      = "iot2-lan-only"
      vlan                      = 23
      router_ports_untagged     = []
      router_ports_tagged       = ["ether2", "ether6", "ether7", "ether8", "ether9", "ether10", "sfp1"]
      switch_ports_untagged     = ["ether19"]
      switch_ports_tagged       = ["ether2", "ether3", "ether5", "ether9", "ether14", "ether15", "ether16", "ether18", "ether22", "ether24"]
    }
    vlan24 = {
      is_enabled                = true
      name                      = "legacy-wifi"
      vlan                      = 24
      router_ports_untagged     = []
      router_ports_tagged       = ["ether2", "ether6", "ether7", "ether8", "ether9", "ether10", "sfp1"]
      switch_ports_untagged     = []
      switch_ports_tagged       = ["ether5"]
    }
  }
}

variable "adguard_host" { }
variable "adguard_user" { }
variable "adguard_pass" { }

variable "router_host" { }
variable "router_hosturl" { }
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
