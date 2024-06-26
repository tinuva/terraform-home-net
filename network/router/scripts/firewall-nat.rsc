:local ipssh "10.0.21.8"
:local ipweb "10.0.21.8"
:local iptorrent "10.0.3.20"
:local porttorrent "51413"

# ensure masquerading exists
:if ([/ip firewall nat print count-only where chain=srcnat action=masquerade out-interface-list="WAN" ipsec-policy="out,none"]=0) do {
    :log info message="creating masquerade rule"
    /ip firewall nat add chain=srcnat action=masquerade out-interface-list="WAN" ipsec-policy="out,none"
}

# port 22 ssh allow list
:if ([/ip firewall address-list print count-only where list="ssh-allowed"]=0) do {
    /ip firewall address-list add address=54.240.197.224/28 list=ssh-allowed
    /ip firewall address-list add address=99.78.144.128/25 list=ssh-allowed
    /ip firewall address-list add address=105.27.196.114/32 list=ssh-allowed
}

# port 22 ssh
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$ipssh && protocol="tcp" && in-interface-list="WAN" && dst-port="22" && src-address-list=ssh-allowed]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="22"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="22"] do={
            /ip firewall nat remove $rule}
    }
    :log info message="creating port 22 forward to $ipssh"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$ipssh protocol=tcp in-interface-list=WAN dst-port=22 src-address-list=ssh-allowed
}

# port 80/443 web
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$ipweb && protocol="tcp" && in-interface-list="WAN" && dst-port="80" && src-address-list=CloudFlare]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="80"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="80"] do={
            /ip firewall nat remove $rule}`
    }
    :log info message="creating port 80 forward to $ipweb"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$ipweb protocol=tcp in-interface-list=WAN dst-port=80 src-address-list=CloudFlare
}
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$ipweb && protocol="tcp" && in-interface-list="WAN" && dst-port="443" && src-address-list=CloudFlare]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="443"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="443"] do={
            /ip firewall nat remove $rule}
    }
    :log info message="creating port 443 forward to $ipweb"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$ipweb protocol=tcp in-interface-list=WAN dst-port=443 src-address-list=CloudFlare
}

# port torrent
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$iptorrent && protocol="tcp" && in-interface-list="WAN" && dst-port="$porttorrent"]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="$porttorrent"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="$porttorrent"] do={
            /ip firewall nat remove $rule}
    }
    :log info message="creating port $porttorrent forward to $iptorrent"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$iptorrent protocol=tcp in-interface-list=WAN dst-port=$porttorrent
}
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$iptorrent && protocol="udp" && in-interface-list="WAN" && dst-port="$porttorrent"]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="udp" && in-interface-list="WAN" && dst-port="$porttorrent"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="udp" && in-interface-list="WAN" && dst-port="$porttorrent"] do={
            /ip firewall nat remove $rule}
    }
    :log info message="creating port $porttorrent forward to $iptorrent"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$iptorrent protocol=udp in-interface-list=WAN dst-port=$porttorrent
}
