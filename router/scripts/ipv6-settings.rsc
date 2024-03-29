

# enable ipv6
:if ([/ipv6 settings get disable-ipv6]=true) do {
    :log info message="IPv6 disabled - re-enabling!"
    /ipv6 settings set disable-ipv6=no
}

## prefixes defaults
:if ([/ipv6 nd prefix default get valid-lifetime]!=4h) do {
    :log info message="IPv6 prefix default - set valid lifetime!"
    /ipv6 nd prefix default set valid-lifetime=4h
}
:if ([/ipv6 nd prefix default get preferred-lifetime]!=4h) do {
    :log info message="IPv6 prefix default - set preferred lifetime!"
    /ipv6 nd prefix default set preferred-lifetime=4h
}


# IPv6 ND

## interfaces
## vlan20 nd default
:if ([/ipv6 nd print count-only where interface=ether3.20 ra-interval="3m20s-10m" ra-delay=3s reachable-time="5m" ra-lifetime="30m" hop-limit=64 advertise-mac-address=yes advertise-dns=no managed-address-configuration=no disabled=no]=0) do {
    /ipv6 nd set [ find default=yes ] advertise-dns=yes interface=ether3.20 mtu=1500 ra-lifetime=30m reachable-time=5m disabled=no
}
## vlan21 nd
:if ([/ipv6 nd print count-only where interface=ether3.21 ra-interval="3m20s-10m" ra-delay=3s reachable-time="5m" ra-lifetime="30m" hop-limit=64 advertise-mac-address=yes advertise-dns=no managed-address-configuration=no]=0) do {
    :log info message="Setting vlan21 ipv6-nd"
    /ipv6 nd add advertise-dns=no hop-limit=64 interface=ether3.21 reachable-time=5m
}

## IPV6 from pool
:if ([ipv6 address print count-only where from-pool=ipv6-pool interface=ether3.20]=0) do {
    :log info message="add ipv6 pool on 3.20"
    /ipv6 address add from-pool=ipv6-pool interface=ether3.20
}
:if ([ipv6 address print count-only where from-pool=ipv6-pool interface=ether3.21]=0) do {
    :log info message="add ipv6 pool on 3.21"
    /ipv6 address add from-pool=ipv6-pool interface=ether3.21
}
