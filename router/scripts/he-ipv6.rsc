:local iplocal "155.93.227.109"
:local ipremote "216.66.87.134"
:local v6gw "2001:470:1f22:4cc::1"
:local v6dst "2000::/3"
:local v6localip "2001:470:1f22:4cc::2/64"
:local v6lanprefix "2001:470:1f23:4cc::1/64"

:if ([/interface 6to4 print count-only where comment="Hurricane Electric IPv6 Tunnel Broker" disabled=no local-address=$iplocal mtu=1280 name=sit1 remote-address=$ipremote]=0) do {
    :log info message="creating he.net 6to4 interface"
    /interface 6to4 add comment="Hurricane Electric IPv6 Tunnel Broker" disabled=no local-address=$iplocal mtu=1280 name=sit1 remote-address=$ipremote
}

:if ([/ipv6 route print count-only where disabled=no distance=1 dst-address=$v6dst gateway=$v6gw scope=30 target-scope=10]=0) do {
    :log info message="creating he.net route"
    /ipv6 route add comment="" disabled=no distance=1 dst-address=$v6dst gateway=$v6gw scope=30 target-scope=10
}

:if ([/ipv6 address print count-only where address="$v6localip" advertise=no disabled=no eui-64=no interface=sit1]=0) do {
    :log info message="creating v6 local ip"
    /ipv6 address add address=$v6localip advertise=no disabled=no eui-64=no interface=sit1
}

:if ([/ipv6 settings get disable-ipv6]=true) do {
    :log info message="IPv6 disabled - re-enabling!"
    /ipv6 settings set disable-ipv6=no
}

#Advertise /64 to LAN
:if ([/ipv6 address print count-only where address="$v6lanprefix" interface=bridge1 advertise=yes]=0) do {
    :log info message="Adding IPv6 to LAN with advertising"
    /ipv6 address add address=$v6lanprefix interface=bridge1 advertise=yes
}