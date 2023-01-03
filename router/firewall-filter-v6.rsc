# default firewall rules, lets keep them in place

## bad_ipv6 ip list
:if ([/ipv6 firewall address-list print count-only where list="bad_ipv6"]=0) do {
    :log info message="creating defconf bad_ipv6 ip list"
    /ipv6 firewall address-list
        add address=::/128 comment="defconf: unspecified address" list=bad_ipv6
        add address=::1/128 comment="defconf: lo" list=bad_ipv6
        add address=fec0::/10 comment="defconf: site-local" list=bad_ipv6
        add address=::ffff:0.0.0.0/96 comment="defconf: ipv4-mapped" list=bad_ipv6
        add address=::/96 comment="defconf: ipv4 compat" list=bad_ipv6
        add address=100::/64 comment="defconf: discard only " list=bad_ipv6
        add address=2001:db8::/32 comment="defconf: documentation" list=bad_ipv6
        add address=2001:10::/28 comment="defconf: ORCHID" list=bad_ipv6
        add address=3ffe::/16 comment="defconf: 6bone" list=bad_ipv6
        add address=::224.0.0.0/100 comment="defconf: other" list=bad_ipv6
        add address=::127.0.0.0/104 comment="defconf: other" list=bad_ipv6
        add address=::/104 comment="defconf: other" list=bad_ipv6
        add address=::255.0.0.0/104 comment="defconf: other" list=bad_ipv6
}

## IPv6 input chain
/ipv6 firewall filteradd action=accept chain=input comment="defconf: accept established,related,untracked" connection-state=established,related,untracked
/ipv6 firewall filteradd action=drop chain=input comment="defconf: drop invalid" connection-state=invalid
/ipv6 firewall filteradd action=accept chain=input comment="defconf: accept ICMPv6" protocol=icmpv6
/ipv6 firewall filteradd action=accept chain=input comment="defconf: accept UDP traceroute" port=33434-33534 protocol=udp
/ipv6 firewall filteradd action=accept chain=input comment="defconf: accept DHCPv6-Client prefix delegation." dst-port=546 protocol=udp src-address=fe80::/10
/ipv6 firewall filteradd action=accept chain=input comment="defconf: accept IKE" dst-port=500,4500 protocol=udp
/ipv6 firewall filteradd action=accept chain=input comment="defconf: accept ipsec AH" protocol=ipsec-ah
/ipv6 firewall filteradd action=accept chain=input comment="defconf: accept ipsec ESP" protocol=ipsec-esp
/ipv6 firewall filteradd action=accept chain=input comment="defconf: accept all that matches ipsec policy" ipsec-policy=in,ipsec
/ipv6 firewall filteradd action=drop chain=input comment="defconf: drop everything else not coming from LAN" in-interface-list=!LAN

## IPv6 forward chain (protect lan)
/ipv6 firewall filteradd action=accept chain=forward comment="defconf: accept established,related,untracked" connection-state=established,related,untracked
/ipv6 firewall filteradd action=drop chain=forward comment="defconf: drop invalid" connection-state=invalid
/ipv6 firewall filteradd action=drop chain=forward comment="defconf: drop packets with bad src ipv6" src-address-list=bad_ipv6
/ipv6 firewall filteradd action=drop chain=forward comment="defconf: drop packets with bad dst ipv6" dst-address-list=bad_ipv6
/ipv6 firewall filteradd action=drop chain=forward comment="defconf: rfc4890 drop hop-limit=1" hop-limit=equal:1 protocol=icmpv6
/ipv6 firewall filteradd action=accept chain=forward comment="defconf: accept ICMPv6" protocol=icmpv6
/ipv6 firewall filteradd action=accept chain=forward comment="defconf: accept HIP" protocol=139
/ipv6 firewall filteradd action=accept chain=forward comment="defconf: accept IKE" dst-port=500,4500 protocol=udp
/ipv6 firewall filteradd action=accept chain=forward comment="defconf: accept ipsec AH" protocol=ipsec-ah
/ipv6 firewall filteradd action=accept chain=forward comment="defconf: accept ipsec ESP" protocol=ipsec-esp
/ipv6 firewall filteradd action=accept chain=forward comment="defconf: accept all that matches ipsec policy" ipsec-policy=in,ipsec
/ipv6 firewall filteradd action=drop chain=forward comment="defconf: drop everything else not coming from LAN" in-interface-list=!LAN