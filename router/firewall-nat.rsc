:local ipssh "192.168.241.235"
:local ipweb "192.168.241.235"
:local iptorrent "192.168.241.182"
:local porttorrent "7000"

# Ensure masquerading exists

:if ([/ip firewall nat print count-only where chain=srcnat action=masquerade out-interface-list="WAN" ipsec-policy="out,none"]=0) do {
    :log info message="creating masquerade rule"
    /ip firewall nat add chain=srcnat action=masquerade out-interface-list="WAN" ipsec-policy="out,none"
}

# port 22 ssh
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$ipssh && protocol="tcp" && in-interface-list="WAN" && dst-port="22"]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="22"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="22"] do={
            /ip firewall nat remove $rule}
    }
    :log info message="creating port 22 forward to $ipssh"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$ipssh protocol=tcp in-interface-list=WAN dst-port=22
}

# port 80/443 web
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$ipweb && protocol="tcp" && in-interface-list="WAN" && dst-port="80"]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="80"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="80"] do={
            /ip firewall nat remove $rule}
    }
    :log info message="creating port 80 forward to $ipweb"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$ipweb protocol=tcp in-interface-list=WAN dst-port=80
}
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$ipweb && protocol="tcp" && in-interface-list="WAN" && dst-port="443"]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="443"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="443"] do={
            /ip firewall nat remove $rule}
    }
    :log info message="creating port 443 forward to $ipweb"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$ipweb protocol=tcp in-interface-list=WAN dst-port=443
}

# port 7000 torrent
:if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && to-addresses=$iptorrent && protocol="tcp" && in-interface-list="WAN" && dst-port="$porttorrent"]=0) do {
    :if ([/ip firewall nat print count-only where chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="$porttorrent"]!=0) do {
        :foreach rule in=[/ip firewall nat find chain=dstnat && action=dst-nat && protocol="tcp" && in-interface-list="WAN" && dst-port="$porttorrent"] do={
            /ip firewall nat remove $rule}
    }
    :log info message="creating port $porttorrent forward to $iptorrent"
    /ip firewall nat add chain=dstnat action=dst-nat to-addresses=$iptorrent protocol=tcp in-interface-list=WAN dst-port=$porttorrent
}