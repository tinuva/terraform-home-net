### vlan ports - router2
variable "router2_bridge_ports" {
  description = "Router port config"
  type = map(object({
    name          = string
    tagged_vlans  = list(number)
    untagged_vlan = number # set to 0 if not a bridge vlan port
  }))
  default = {
    "ether1" = {
      name          = "internet-ftth"
      untagged_vlan = 0
      tagged_vlans  = []
    }
    "ether4" = {
      name          = "camera-back"
      untagged_vlan = 23
      tagged_vlans  = []
    }
    "ether5" = {
      name          = "ripe-probe"
      untagged_vlan = 23
      tagged_vlans  = []
    }
    "ether6" = {
      name          = "braai-room-lan-at-braai"
      untagged_vlan = 20
      tagged_vlans  = []
    }
    "ether7" = {
      name          = "lounge-rb750"
      untagged_vlan = 1
      tagged_vlans  = [20, 21, 22, 23]
    }
    "ether8" = {
      name          = "office-wifi"
      untagged_vlan = 21
      tagged_vlans  = [20, 22, 23]
    }
    "ether9" = {
      name          = "synology-nas"
      untagged_vlan = 21
      tagged_vlans  = []
    }
    "ether10" = {
      name          = "nuc"
      untagged_vlan = 21
      tagged_vlans  = [20, 22]
    }
    "sfp1" = {
      name          = "uplink"
      untagged_vlan = 1
      tagged_vlans  = [20, 21, 22, 23, 24]
    }
  }
}

### vlan ports - router
variable "router_bridge_ports" {
  description = "Router port config"
  type = map(object({
    name          = string
    tagged_vlans  = list(number)
    untagged_vlan = number # set to 0 if not a bridge vlan port
  }))
  default = {
    "ether1" = {
      name          = "internet-ftth"
      untagged_vlan = 0
      tagged_vlans  = []
    }
    "ether2" = {
      name          = "switch-ether5"
      untagged_vlan = 1
      tagged_vlans  = [20, 21, 22, 23, 24]
    }
    "ether6" = {
      name          = "braai-room-lan-at-braai"
      untagged_vlan = 20
      tagged_vlans  = []
    }
    "ether7" = {
      name          = "lounge-rb750"
      untagged_vlan = 1
      tagged_vlans  = [20, 21, 22, 23]
    }
    "ether8" = {
      name          = "office-wifi"
      untagged_vlan = 21
      tagged_vlans  = [20, 22, 23]
    }
    "ether9" = {
      name          = "synology-nas"
      untagged_vlan = 21
      tagged_vlans  = []
    }
    "ether10" = {
      name          = "nuc"
      untagged_vlan = 21
      tagged_vlans  = [20, 22]
    }
    "sfp1" = {
      name          = "switch-dell-back-grg"
      untagged_vlan = 1
      tagged_vlans  = [20, 21, 22, 23, 24]
    }
  }
}

### vlan ports - switch
variable "switch_bridge_ports" {
  description = "Switch Port Config"
  type = map(object({
    name          = string
    tagged_vlans  = list(number)
    untagged_vlan = number # set to 0 if not a bridge vlan port
  }))
  default = {
    "ether2" = {
      name          = "internet-ftth-to-cpe"
      untagged_vlan = 10
      tagged_vlans  = []
    }
    "ether3" = {
      name          = "internet-ftth-to-router"
      untagged_vlan = 10
      tagged_vlans  = []
    }
    "ether4" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
    "ether5" = {
      name          = "rtr-rb3011-ether2"
      untagged_vlan = 1
      tagged_vlans  = [20, 21, 22, 23, 24]
    }
    "ether6" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
    "ether7" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
    "ether8" = {
      name          = "nuc"
      untagged_vlan = 21
      tagged_vlans  = [20, 22]
    }
    "ether9" = {
      name          = "office-wifi"
      untagged_vlan = 21
      tagged_vlans  = [20, 22, 23]
    }
    "ether10" = {
      name          = "braai-room-lan-at-braai"
      untagged_vlan = 20
      tagged_vlans  = []
    }
    "ether11" = {
      name          = "synology-nas"
      untagged_vlan = 21
      tagged_vlans  = []
    }
    "ether12" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
    "ether13" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
    "ether14" = {
      name          = "lounge-rb750"
      untagged_vlan = 1
      tagged_vlans  = [20, 21, 22, 23]
    }
    "ether15" = {
      name          = "braai-room-wifi"
      untagged_vlan = 21
      tagged_vlans  = [20, 22, 23]
    }
    "ether16" = {
      name          = "offce-rb961"
      untagged_vlan = 1
      tagged_vlans  = [20, 22, 23]
    }
    "ether17" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
    "ether18" = {
      name          = "front-garage-wifi"
      untagged_vlan = 21
      tagged_vlans  = [20, 22, 23]
    }
    "ether19" = {
      name          = "front-garage-camera"
      untagged_vlan = 23
      tagged_vlans  = []
    }
    "ether20" = {
      name          = "lte-router"
      untagged_vlan = 11
      tagged_vlans  = []
    }
    "ether21" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
    "ether22" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
    "ether23" = {
      name          = "temp-clients"
      untagged_vlan = 20
      tagged_vlans  = []
    }
    "ether24" = {
      name          = ""
      untagged_vlan = 1
      tagged_vlans  = []
    }
  }
}

### vlan mapping
# https://stackoverflow.com/questions/64133145/terraform-iterate-through-map-of-maps-depending-on-value-of-internal-map
variable "bridge_vlans" {
  type = map(object({
    is_enabled = bool
    name       = string
    vlan       = number
  }))
  default = {
    vlan01 = {
      is_enabled = true
      name       = "mgmt"
      vlan       = 1
    }
    vlan20 = {
      is_enabled = true
      name       = "clients"
      vlan       = 20
    }
    vlan21 = {
      is_enabled = true
      name       = "servers"
      vlan       = 21
    }
    vlan22 = {
      is_enabled = true
      name       = "iot"
      vlan       = 22
    }
    vlan23 = {
      is_enabled = true
      name       = "iot2-lan-only"
      vlan       = 23
    }
    vlan24 = {
      is_enabled = true
      name       = "legacy-wifi"
      vlan       = 24
    }
  }
}

variable "hosts" {
  description = "Lan hosts config"
  default = {
    "dev" = {
      mac_addr  = "72:73:A7:53:5A:CE"
      vlan      = 21
      ip_suffix = 5
    }
  }
}

variable "ipv4_firewall_filter_rules" {
  type = list(object({
    chain                = string
    action               = string
    connection_state     = optional(string)
    connection_nat_state = optional(string)
    in_interface_list    = optional(string)
    out_interface_list   = optional(string)
    src_address          = optional(string)
    dst_address          = optional(string)
    src_address_list     = optional(string)
    dst_address_list     = optional(string)
    src_port             = optional(string)
    dst_port             = optional(string)
    protocol             = optional(string)
    ipsec_policy         = optional(string)
    hw_offload           = optional(bool)
    comment              = optional(string, "(terraform-defined)")
    log                  = optional(bool, false)
    disabled             = optional(bool, true)
  }))

  default = [
    { disabled = false, chain = "input", action = "accept", comment = "defconf: accept established,related,untracked", connection_state = "established,related,untracked" },
    { disabled = false, chain = "input", action = "drop", comment = "defconf: drop invalid", connection_state = "invalid" },
    { disabled = false, chain = "input", action = "accept", comment = "defconf: accept ICMP from list", protocol = "icmp", src_address_list = "icmp-allowed" },
    { disabled = false, chain = "input", action = "accept", comment = "wireguard: david", protocol = "udp", dst_port = "13231" },
    { disabled = false, chain = "input", action = "drop", comment = "defconf: drop all not coming from LAN", in_interface_list = "!LAN" },
    { disabled = false, chain = "forward", action = "accept", comment = "defconf: accept in ipsec policy", ipsec_policy = "in,ipsec" },
    { disabled = false, chain = "forward", action = "accept", comment = "defconf: accept out ipsec policy", ipsec_policy = "out,ipsec" },
    { disabled = false, chain = "forward", action = "fasttrack-connection", comment = "defconf: fasttrack", connection_state = "established,related", hw_offload = true },
    { disabled = false, chain = "forward", action = "accept", comment = "defconf: accept established,related, untracked", connection_state = "established,related,untracked" },
    { disabled = false, chain = "forward", action = "drop", comment = "defconf: drop invalid", connection_state = "invalid" },
    { disabled = false, chain = "forward", action = "drop", comment = "defconf: drop all from WAN not DSTNATed", connection_state = "new", connection_nat_state = "!dstnat", in_interface_list = "WAN" },
  ]
}

variable "ipv4_firewall_nat_rules" {
  type = list(object({
    chain              = string
    action             = string
    in_interface_list  = optional(string)
    out_interface_list = optional(string)
    src_address        = optional(string)
    dst_address        = optional(string)
    src_address_list   = optional(string)
    dst_address_list   = optional(string)
    to_addresses       = optional(string)
    src_port           = optional(string)
    dst_port           = optional(string)
    protocol           = optional(string)
    ipsec_policy       = optional(string)
    comment            = optional(string, "(terraform-defined)")
    log                = optional(bool, false)
    disabled           = optional(bool, true)
  }))

  default = [
    { disabled = false, chain = "srcnat", action = "masquerade", comment = "defconf: masquerade WAN out", out_interface_list = "WAN", ipsec_policy = "out,none" },
    { disabled = false, chain = "srcnat", action = "masquerade", comment = "evnisalink fix", dst_address = "10.0.1.18" },
    { disabled = false, chain = "dstnat", action = "dst-nat", comment = "ssh", protocol = "tcp", dst_port = "22", to_addresses = "10.0.21.8", src_address_list = "ssh-allowed", in_interface_list = "WAN" },
    { disabled = false, chain = "dstnat", action = "dst-nat", comment = "http", protocol = "tcp", dst_port = "80", to_addresses = "10.0.21.8", src_address_list = "CloudFlare", in_interface_list = "WAN" },
    { disabled = false, chain = "dstnat", action = "dst-nat", comment = "https", protocol = "tcp", dst_port = "443", to_addresses = "10.0.21.8", src_address_list = "CloudFlare", in_interface_list = "WAN" },
    { disabled = false, chain = "dstnat", action = "dst-nat", comment = "torrent", protocol = "tcp", dst_port = "51413", to_addresses = "10.0.21.24", in_interface_list = "WAN" },
    { disabled = false, chain = "dstnat", action = "dst-nat", comment = "torrent", protocol = "udp", dst_port = "51413", to_addresses = "10.0.21.24", in_interface_list = "WAN" },
  ]
}

variable "ipv4_firewall_address_lists" {
  default = {
    "icmp-allowed" = [
      "66.220.2.74"
    ]
    "ssh-allowed" = [
      "105.27.196.102",
      "105.27.196.114",
      "15.244.0.0/14",
      "15.248.0.0/16",
      "54.240.197.224/28",
      "99.78.144.128/25",
    ]
  }
}

variable "ipv6_firewall_address_lists" {
  default = {
    "bad-ipv6" = [
      { "address" = "::/128", comment = "defconf: unspecified address" },
      { "address" = "::1/128", comment = "defconf: lo" },
      { "address" = "fec0::/10", comment = "defconf: site-local" },
      { "address" = "::ffff:0.0.0.0/96", comment = "defconf: ipv4-mapped" },
      { "address" = "::/96", comment = "defconf: ipv4 compat" },
      { "address" = "100::/64", comment = "defconf: discard only" },
      { "address" = "2001:db8::/32", comment = "defconf: documentation" },
      { "address" = "2001:10::/28", comment = "defconf: ORCHID" },
      { "address" = "3ffe::/16", comment = "defconf: 6bone" },
      { "address" = "::224.0.0.0/100", comment = "defconf: other" },
      { "address" = "::127.0.0.0/104", comment = "defconf: other" },
      { "address" = "::/104", comment = "defconf: other" },
      { "address" = "::255.0.0.0/104", comment = "defconf: other" },
    ]
  }
}

variable "ipv6_firewall_filter_rules" {
  type = list(object({
    chain              = string
    action             = string
    connection_state   = optional(string)
    in_interface       = optional(string)
    out_interface      = optional(string)
    in_interface_list  = optional(string)
    out_interface_list = optional(string)
    src_address        = optional(string)
    dst_address        = optional(string)
    src_address_list   = optional(string)
    dst_address_list   = optional(string)
    src_port           = optional(string)
    dst_port           = optional(string)
    protocol           = optional(string)
    ipsec_policy       = optional(string)
    comment            = optional(string, "(terraform-defined)")
    log                = optional(bool, false)
    disabled           = optional(bool, true)
  }))

  default = [
    # input chain
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept established,related,untracked", connection-state = "established,related,untracked" },
    { disabled = false, action = "drop", chain = "input", comment = "defconf: drop invalid", connection-state = "invalid" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept ICMPv6", protocol = "icmpv6" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept UDP traceroute", port = "33434-33534", protocol = "udp" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept DHCPv6-Client prefix delegation", dst-port = "546", protocol = "udp", src-address = "fe80::/10" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept IKE", dst-port = "500,4500", protocol = "udp" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept ipsec AH", protocol = "ipsec-ah" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept ipsec ESP", protocol = "ipsec-esp" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept all that matches ipsec policy", ipsec-policy = "in,ipsec" },
    { disabled = false, action = "accept", chain = "input", comment = "accept: dhcpv6", protocol = "udp", dst-port = "546", in_interface = "all-ppp" },
    { disabled = false, action = "drop", chain = "input", comment = "defconf: drop everything else not coming from LAN", in_interface_list = "!LAN" },
    # forward chain
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept established,related,untracked", connection-state = "established,related,untracked" },
    { disabled = false, action = "drop", chain = "forward", comment = "defconf: drop invalid", connection-state = "invalid" },
    { disabled = false, action = "drop", chain = "forward", comment = "defconf: drop packets with bad src ipv6", src-address-list = "bad-ipv6" },
    { disabled = false, action = "drop", chain = "forward", comment = "defconf: drop packets with bad dst ipv6", dst-address-list = "bad-ipv6" },
    { disabled = true, action = "drop", chain = "forward", comment = "defconf: rfc4890 fd00:: drop hop-limit=1", hop-limit = "equal:1", protocol = "icmpv6" },
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept ICMPv6", protocol = "icmpv6" },
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept HIP", protocol = "139" },
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept IKE", dst-port = "500,4500", protocol = "udp" },
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept ipsec AH", protocol = "ipsec-ah" },
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept ipsec ESP", protocol = "ipsec-esp" },
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept all that matches ipsec policy", ipsec-policy = "in,ipsec" },
    { disabled = false, action = "drop", chain = "forward", comment = "defconf: drop everything else not coming from LAN", in_interface_list = "!LAN" },
  ]
}


variable "adguard_host" {}
variable "adguard_user" {}
variable "adguard_pass" {}

variable "router_host" {}
variable "router_hosturl" {}
variable "router2_host" {}
variable "router2_hosturl" {}
variable "router_user" {}
variable "router_pass" {}

variable "switch_hosturl" {}
variable "switch_user" {}
variable "switch_pass" {}

variable "cloudflare_api_key" {}
variable "cloudflare_email" {}
variable "cloudflare_zone_id" {}

variable "domain" {}
variable "records" {}
variable "records_local_only" {}
variable "recordsv6_local_only" {}
variable "records_local_only_adguard" {}

variable "zone" {}
variable "records_a" {}
variable "records_aaaa" {}
variable "records_cname" {}

variable "pdns_server_url" {}
variable "pdns_secret" {}

variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}

variable "ovh" {}
