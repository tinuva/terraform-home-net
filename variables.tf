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
      name          = "zigstar"
      untagged_vlan = 22
      tagged_vlans  = []
    }
    "ether21" = {
      name          = "lte-router"
      untagged_vlan = 11
      tagged_vlans  = []
    }
    "ether22" = {
      name          = "pethub"
      untagged_vlan = 22
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
  type = map(object({
    mac_addr   = string
    vlan       = number
    ip_suffix  = number
    cf_proxied = optional(bool, true)
    add_local_dns = optional(bool, false)
  }))
  description = "Lan hosts config"
  default = {
    # don't use .5 thats for dns keepalive
    "dev" = {
      mac_addr  = "72:73:A7:53:5A:CE"
      vlan      = 21
      ip_suffix = 6
    }
    "bastion" = {
      mac_addr   = "BE:AF:7F:80:71:8E"
      vlan       = 21
      ip_suffix  = 8
      cf_proxied = false
    }
    "pve-nuc11" = {
      mac_addr  = "88:ae:dd:01:f9:e7"
      vlan      = 21
      ip_suffix = 9
    }
    "netm" = {
      mac_addr  = "BA:DF:A0:82:9C:9A"
      vlan      = 21
      ip_suffix = 14
    }
    "blue" = {
      mac_addr = "96:5D:29:33:61:BE"
      vlan = 21
      ip_suffix = 21
    }
    "logs" = {
      mac_addr = "C6:AE:05:52:34:42"
      vlan = 21
      ip_suffix = 22
    }
    "pethub" = {
      mac_addr = "0A:32:B6:E2:1B:09"
      vlan = 22
      ip_suffix = 18
    }
    "zigstar" = {
      mac_addr = "24:DC:C3:C0:73:13"
      vlan = 22
      ip_suffix = 20
      add_local_dns = true
    }
    "bluetooth-proxy-mainbedroom" = {
      mac_addr = "30:C6:F7:43:FF:7C"
      vlan = 22
      ip_suffix = 21
      add_local_dns = true
    }
    "bluetooth-proxy-braairoom" = {
      mac_addr = "30:C6:F7:42:F2:10"
      vlan = 22
      ip_suffix = 22
      add_local_dns = true
    }
    "bluetooth-proxy-kitchen" = {
      mac_addr = "30:C6:F7:43:03:40"
      vlan = 22
      ip_suffix = 23
      add_local_dns = true
    }
    "wpsd" = {
      mac_addr = "2C:CF:67:21:47:A6"
      vlan = 22
      ip_suffix = 24
    }
  }
}

variable "non_host_dns" {
  type = map(object({
    ip_v4 = string
    ip_v6 = string
  }))
  description = "Lan hosts config"
  default = {
    "oracle" = {
      ip_v4 = "10.49.0.1"
      ip_v6 = "fd49::1"
    }
  }
}

variable "ipv4_firewall_filter_rules" {
  type = list(object({
    chain                = string
    action               = string
    connection_state     = optional(string)
    connection_nat_state = optional(string)
    in_interface         = optional(string)
    out_interface        = optional(string)
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
    { disabled = false, chain = "input", action = "accept", comment = "wireguard: oracle", protocol = "udp", dst_port = "51820" },
    # ORACLE VPS WIREGUARD VPN
    { disabled = false, chain = "input", action = "accept", comment = "Oracle WG VPN", in_interface = "wireguard-oracle-instance1" },
    { disabled = false, chain = "input", action = "drop", comment = "defconf: drop all not coming from LAN", in_interface_list = "!LAN" },

    { disabled = false, chain = "forward", action = "fasttrack-connection", comment = "defconf: fasttrack", connection_state = "established,related", hw_offload = true },
    { disabled = false, chain = "forward", action = "accept", comment = "defconf: accept established,related, untracked", connection_state = "established,related,untracked" },
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept icmp coming from LAN", in_interface_list = "LAN", protocol = "icmp" },

    # VLAN22-IOT
    ## GoodWe Inverter
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot goodwe", in_interface = "vlan22-iot", src_address = "10.0.22.10" },
    ## wpsd
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot wpsd", in_interface = "vlan22-iot", src_address = "10.0.22.24" },
    ## Home Assistant
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot HomeAssistant", in_interface = "vlan22-iot", src_address = "10.0.22.9", dst_address = "10.0.0.0/23" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot HomeAssistant", in_interface = "vlan22-iot", src_address = "10.0.22.9", out_interface_list = "!LAN", protocol = "tcp", dst_port = "22" },
    ## Bamblulab Printer
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "tcp", dst_port = "8080" },             # http api
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "tcp", dst_port = "8883" },             # mqtt
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "tcp", dst_port = "8000,21047,10001" }, # video
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "udp", dst_port = "10001-10512" },      # video
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "tcp", dst_port = "3000" },             # device binding
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "tcp", dst_port = "123" },              # NTP
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "udp", dst_port = "123" },              # NTP
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "udp", dst_port = "1900" },             # SSDP
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "udp", dst_port = "1990" },             # SSDP
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot bambulab", in_interface = "vlan22-iot", src_address = "10.0.22.7", protocol = "udp", dst_port = "2021" },             # SSDP
    ## VLAN22 Global Rules 
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot accept dns", in_interface = "vlan22-iot", protocol = "udp", dst_port = "53" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot accept logs", in_interface = "vlan22-iot", protocol = "tcp", dst_port = "5514" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot accept logs", in_interface = "vlan22-iot", protocol = "udp", dst_port = "5514" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot accept NOT_LAN", in_interface = "vlan22-iot", out_interface_list = "!LAN" },
    { disabled = false, chain = "forward", action = "drop", comment = "vlan22-iot drop all", in_interface = "vlan22-iot" },

    # VLAN23-IOT2
    { disabled = false, chain = "forward", action = "accept", comment = "vlan23-iot accept dns", in_interface = "vlan23-iot2-lan-only", protocol = "udp", dst_port = "53" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan23-iot accept http", in_interface = "vlan23-iot2-lan-only", out_interface_list = "!LAN", protocol = "tcp", dst_port = "80" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan23-iot accept https", in_interface = "vlan23-iot2-lan-only", out_interface_list = "!LAN", protocol = "tcp", dst_port = "443" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan23-iot accept udp", in_interface = "vlan23-iot2-lan-only", out_interface_list = "!LAN", protocol = "udp" },
    { disabled = false, chain = "forward", action = "drop", comment = "vlan23-iot drop all", in_interface = "vlan23-iot2-lan-only" },

    # IPSEC
    #{ disabled = true, chain = "forward", action = "accept", comment = "defconf: accept in ipsec policy", ipsec_policy = "in,ipsec" },
    #{ disabled = true, chain = "forward", action = "accept", comment = "defconf: accept out ipsec policy", ipsec_policy = "out,ipsec" },

    # ORACLE VPS WIREGUARD VPN
    { disabled = false, chain = "forward", action = "accept", comment = "Oracle WG VPN", in_interface = "wireguard-oracle-instance1" },

    # DROP INVALID
    { disabled = false, chain = "forward", action = "drop", comment = "defconf: drop invalid", connection_state = "invalid" },
    # DROP ALL (except wan forwarded)
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
    hop_limit          = optional(string)
    comment            = optional(string, "(terraform-defined)")
    log                = optional(bool, false)
    disabled           = optional(bool, true)
  }))

  default = [
    # input chain
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept established,related,untracked", connection_state = "established,related,untracked" },
    { disabled = false, action = "drop", chain = "input", comment = "defconf: drop invalid", connection_state = "invalid" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept ICMPv6", protocol = "icmpv6" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept UDP traceroute", dst_port = "33434-33534", protocol = "udp" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept DHCPv6-Client prefix delegation", dst_port = "546", protocol = "udp", src-address = "fe80::/10" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept IKE", dst_port = "500,4500", protocol = "udp" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept ipsec AH", protocol = "ipsec-ah" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept ipsec ESP", protocol = "ipsec-esp" },
    { disabled = false, action = "accept", chain = "input", comment = "defconf: accept all that matches ipsec policy", ipsec_policy = "in,ipsec" },
    { disabled = false, action = "accept", chain = "input", comment = "accept: dhcpv6", protocol = "udp", dst_port = "546", in_interface = "all-ppp" },
    # ORACLE VPS WIREGUARD VPN
    { disabled = false, chain = "input", action = "accept", comment = "Oracle WG VPN", in_interface = "wireguard-oracle-instance1" },
    { disabled = false, action = "drop", chain = "input", comment = "defconf: drop everything else not coming from LAN", in_interface_list = "!LAN" },

    # forward chain
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept established,related,untracked", connection_state = "established,related,untracked" },
    { disabled = false, action = "drop", chain = "forward", comment = "defconf: drop invalid", connection_state = "invalid" },
    { disabled = false, action = "drop", chain = "forward", comment = "defconf: drop packets with bad src ipv6", src_address_list = "bad-ipv6" },
    { disabled = false, action = "drop", chain = "forward", comment = "defconf: drop packets with bad dst ipv6", dst_address_list = "bad-ipv6" },
    { disabled = true, action = "drop", chain = "forward", comment = "defconf: rfc4890 fd00:: drop hop-limit=1", hop_limit = "equal:1", protocol = "icmpv6" },
    { disabled = false, action = "accept", chain = "forward", comment = "defconf: accept ICMPv6", protocol = "icmpv6" },
    #{ disabled = false, action = "accept", chain = "forward", comment = "defconf: accept HIP", protocol = "139" },
    #{ disabled = false, action = "accept", chain = "forward", comment = "defconf: accept IKE", dst_port = "500,4500", protocol = "udp" },
    #{ disabled = false, action = "accept", chain = "forward", comment = "defconf: accept ipsec AH", protocol = "ipsec-ah" },
    #{ disabled = false, action = "accept", chain = "forward", comment = "defconf: accept ipsec ESP", protocol = "ipsec-esp" },
    #{ disabled = false, action = "accept", chain = "forward", comment = "defconf: accept all that matches ipsec policy", ipsec_policy = "in,ipsec" },

    # VLAN22-IOT
    ## Home Assistant
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot HomeAssistant", in_interface = "vlan22-iot", src_address = "fd00:22::55eb:868:3649:e84e/128", out_interface_list = "!LAN", protocol = "tcp", dst_port = "22" },
    # global v22 rules
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot accept dns", in_interface = "vlan22-iot", protocol = "udp", dst_port = "53" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot accept logs", in_interface = "vlan22-iot", protocol = "tcp", dst_port = "5514" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot accept logs", in_interface = "vlan22-iot", protocol = "udp", dst_port = "5514" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan22-iot accept NOT_LAN", in_interface = "vlan22-iot", out_interface_list = "!LAN" },
    { disabled = false, chain = "forward", action = "drop", comment = "vlan22-iot drop all", in_interface = "vlan22-iot" },

    # VLAN23-IOT2
    { disabled = false, chain = "forward", action = "accept", comment = "vlan23-iot accept dns", in_interface = "vlan23-iot2-lan-only", protocol = "udp", dst_port = "53" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan23-iot accept http", in_interface = "vlan23-iot2-lan-only", out_interface_list = "!LAN", protocol = "tcp", dst_port = "80" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan23-iot accept https", in_interface = "vlan23-iot2-lan-only", out_interface_list = "!LAN", protocol = "tcp", dst_port = "443" },
    { disabled = false, chain = "forward", action = "accept", comment = "vlan23-iot accept udp", in_interface = "vlan23-iot2-lan-only", out_interface_list = "!LAN", protocol = "udp" },
    { disabled = false, chain = "forward", action = "drop", comment = "vlan23-iot drop all", in_interface = "vlan23-iot2-lan-only" },

    # Default IPv6 allow 80/443 to vlan21 servers 
    { disabled = false, chain = "forward", action = "accept", comment = "WAN to VLAN21-servers accept http", out_interface = "vlan21-servers", protocol = "tcp", dst_port = "80" },
    { disabled = false, chain = "forward", action = "accept", comment = "WAN to VLAN21-servers accept https", out_interface = "vlan21-servers", protocol = "tcp", dst_port = "443" },
    # SSH BASTION 
    { disabled = false, chain = "forward", action = "accept", comment = "WAN to bastion accept ssh", out_interface = "vlan21-servers", protocol = "tcp", dst_port = "22", dst_address = "fd00:21::bcaf:7fff:fe80:718e/128" },
    { disabled = false, chain = "forward", action = "accept", comment = "WAN to bastion accept ssh", out_interface = "vlan21-servers", protocol = "tcp", dst_port = "22", dst_address = "2c0f:f2a0:2058:5:bcaf:7fff:fe80:718e/128" },
    # ORACLE VPS WIREGUARD VPN
    { disabled = false, chain = "forward", action = "accept", comment = "Oracle WG VPN", in_interface = "wireguard-oracle-instance1" },

    # DROP ALL not from LAN
    { disabled = false, action = "drop", chain = "forward", comment = "defconf: drop everything else not coming from LAN", in_interface_list = "!LAN" },
  ]
}


variable "wireguard_client_oc" {}

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


variable "records_cname" {
  type = map(object({
    host       = string
    cf_enabled = optional(bool, true)
  }))
  default = {
    "pdns"          = { host = "ns1" }
    "pdns-admin"    = { host = "ns1" }
    "adguardhome"   = { host = "netm" }
    "unifi"         = { host = "netm" }
    "bi"            = { host = "bastion" }
    "comms"         = { host = "netm" }
    "grafana"       = { host = "haa" }
    "ha"            = { host = "bastion" }
    "alarmserver"   = { host = "stax" }
    "envisalink"    = { host = "bastion" }
    "mktxp-grafana" = { host = "stax" }
    "netmon"        = { host = "netm" }
    "router"        = { host = "bastion" }
    "switch"        = { host = "bastion" }
    "tasmoadmin"    = { host = "haa" }
    "tasmobackup"   = { host = "haa" }
    "traefik"       = { host = "bastion" }
    "uptime-remote" = { host = "oracle" }
    "uptime"        = { host = "netm" }
    "w"             = { host = "bastion" }
    "zigbee2mqtt"   = { host = "haa" }
    "zha"           = { host = "stax" }
    "sonarr"        = { host = "saltbox", cf_enabled = false }
    "radarr"        = { host = "saltbox", cf_enabled = false }
    "ombi"          = { host = "saltbox", cf_enabled = false }
    "organizr"      = { host = "saltbox", cf_enabled = false }
    "nzbget"        = { host = "saltbox", cf_enabled = false }
    "rutorrent"     = { host = "saltbox", cf_enabled = false }
    "portainer"     = { host = "saltbox", cf_enabled = false }
    "jackett"       = { host = "saltbox", cf_enabled = false }
    "nzbhydra2"     = { host = "saltbox", cf_enabled = false }
    "plexpy"        = { host = "saltbox", cf_enabled = false }
    "plex"          = { host = "saltbox", cf_enabled = false }
    "lidarr"        = { host = "saltbox", cf_enabled = false }
    "login"         = { host = "saltbox", cf_enabled = false }
    "autoscan"      = { host = "saltbox", cf_enabled = false }
    "emqx"          = { host = "haa" }
    "esphome"        = { host = "haa" }
  }
}

variable "pdns_server_url" {}
variable "pdns_secret" {}

variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}

variable "ovh" {}
