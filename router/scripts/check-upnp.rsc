# enable upnp
:if ([/ip upnp get enabled]=false) do {
    :log info message="upnp disabled"
    /ip upnp set enable=yes
}

# disable allow-disable-external-interface
:if ([/ip upnp get allow-disable-external-interface]=true) do {
    :log info message="upnp allow-disabled-external-interface enabled!"
    /ip upnp set allow-disable-external-interface=no
}

# ensure interfaces are set (only a basic test)
:if ([/ip upnp interface print count-only]=0) do {
    :log info message="adding upnp interfaces and enable them"
    /ip upnp interfaces add interface=ether1 type=external
    /ip upnp interfaces add interface=bridge type=internal
    /ip upnp interfaces enable 0,1
}