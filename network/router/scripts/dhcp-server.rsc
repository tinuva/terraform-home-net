# set ip pool for dhcp server
:if ([/ip pool print count-only where name="default-dhcp" ranges="10.0.0.102-10.0.0.254"]=0) do {
    :log info message="setting dhcp pool"
    /ip pool set [find name=default-dhcp] ranges=10.0.0.102-10.0.0.254
}

:if ([/ip pool print count-only where name="pool10-1" ranges="10.0.1.41-10.0.1.254"]=0) do {
    :log info message="setting dhcp pool pool10-1"
    /ip pool add name=pool10-1 ranges=10.0.1.41-10.0.1.254    
}

# set dhcp-server network if not exist
:if ([/ip dhcp-server network print count-only]=0) do {
    /ip dhcp-server network add address=10.0.0.0/23 gateway=10.0.0.1 dns-server=10.0.0.2 ntp-server=10.0.0.1 netmask=23
}
# set dhcp-server network if exist
:if ([/ip dhcp-server network print count-only where address="10.0.0.0/23" gateway=10.0.0.1 dns-server=10.0.0.2 ntp-server=10.0.0.1 netmask=23]=0) do {
    :log info message="setting dhcp network"
    /ip dhcp-server network set 0 address=10.0.0.0/23 gateway=10.0.0.1 dns-server=10.0.0.2 ntp-server=10.0.0.1 netmask=23
}

# set dhcp-server leasetime
:if ([/ip dhcp-server print count-only where name=defconf lease-time=4w3d]=0) do {
    :log info message="setting dhcp server lease time"
    # set to 31 dats
    /ip dhcp-server set 0  name=defconf lease-time=4w3d
}
