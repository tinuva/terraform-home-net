# enable vrrp interface
:if ([/interface vrrp print count-only]=0) do {
    /interface vrrp add authentication=simple interface=ether3.21 name=vrrp1 version=2 vrid=2 password=pihole77
}
:if ([/interface vrrp print count-only where authentication=simple interface=ether3.21 name=vrrp1 version=2 vrid=2 password=pihole77]=0) do {
    /interface vrrp set vrrp1 authentication=simple interface=ether3.21 name=vrrp1 version=2 vrid=2 password=pihole77
}

# ensure vrrp is on LAN list
:if ([/interface list member print count-only where interface=vrrp1 list=LAN]=0) do {
    /interface list member add interface=vrrp1 list=LAN
}

# check ip on vrrp
:if ([/ip address print count-only where interface=vrrp1]=0) do {
    /ip address add address=10.0.3.2/24 interface=vrrp1 network=10.0.3.0
}