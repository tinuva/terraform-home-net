# set ip pool for dhcp server
:if ([/ip pool print count-only where name="default-dhcp" ranges="192.168.241.101-192.168.241.254"]=0) do {
    :log info message="setting dhcp pool"
    /ip pool set [find name=default-dhcp] ranges=192.168.241.101-192.168.241.254
}

# set dhcp-server network
:if ([/ip dhcp-server network print count-only where address="192.168.241.0/24" gateway=192.168.241.1 dns-server=192.168.241.2]=0) do {
    :log info message="setting dhcp network"
    #/ip dhcp-server network set [find address="192.168.88.1/24"] address=192.168.241.0/24 gateway=192.168.241.1 dns-server=192.168.241.2
    /ip dhcp-server network set 0 address=192.168.241.0/24 gateway=192.168.241.1 dns-server=192.168.241.2
}

# set dhcp-server leasetime
:if ([/ip dhcp-server print count-only where name=defconf lease-time=4w3d]=0) do {
    :log info message="setting dhcp server lease time"
    /ip dhcp-server set 0  name=defconf lease-time=4w3d # 31 days
}