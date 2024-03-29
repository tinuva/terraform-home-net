:local HOST "1.1.1.1"
:local PINGCOUNT "10"
:local INT "ether5"
:local DELAY "3s"

:if ([/ping $HOST interval=1 count=$PINGCOUNT] = 0) do={
:log error "HOST $HOST is not responding to ping request, reseting dhcp-client 0..."
/ip dhcp-client release 0
/ip dhcp-client renew 0
} 
#else {
#:log warning "HOST $HOST ping is ok, no need to take any action ...";
#}