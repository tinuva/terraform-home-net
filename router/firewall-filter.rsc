
# default firewall rules, lets keep them in place
# defconf: accept established,related,untracked
:if ([/ip firewall filter print count-only where action=accept chain=input comment="defconf: accept established,related,untracked" connection-state="established,related,untracked"]=0) do {
    :log info message="creating defconf established,related,untracked"
    /ip firewall filter add action=accept chain=input comment="defconf: accept established,related,untracked" connection-state=established,related,untracked
}
# defconf: drop invalid
:if ([/ip firewall filter print count-only where action=drop chain=input comment="defconf: drop invalid" connection-state="invalid"]=0) do {
    :log info message="creating drop invalid"
    /ip firewall filter add action=drop chain=input comment="defconf: drop invalid" connection-state=invalid
}
# defconf: accept ICMP
:if ([/ip firewall filter print count-only where action=accept chain=input comment="defconf: accept ICMP" protocol="icmp"]=0) do {
    :log info message="creating accept ICMP"
    /ip firewall filter add action=accept chain=input comment="defconf: accept ICMP" protocol=icmp
}
# Check that this icmp rule is disabled
:if ([/ip firewall filter print count-only where action=accept chain=input comment="defconf: accept ICMP" protocol="icmp" disabled]=0) do={
    # Rule is enabled
    :log info message="disabling accept ICMP rule"
    /ip firewall filter disable [/ip firewall filter find action=accept chain=input comment="defconf: accept ICMP" protocol="icmp"]
}
# defconf: accept to local loopback (for CAPsMAN)
:if ([/ip firewall filter print count-only where action=accept chain=input comment="defconf: accept to local loopback (for CAPsMAN)" dst-address="127.0.0.1"]=0) do {
    :log info message="creating accept to local loopback (for CAPsMAN)"
    /ip firewall filter add action=accept chain=input comment="defconf: accept to local loopback (for CAPsMAN)" dst-address=127.0.0.1
}
# defconf: drop all not coming from LAN
:if ([/ip firewall filter print count-only where action=drop chain=input comment="defconf: drop all not coming from LAN" in-interface-list="!LAN"]=0) do {
    :log info message="creating drop all not coming from LAN"
    /ip firewall filter add action=drop chain=input comment="defconf: drop all not coming from LAN" in-interface-list=!LAN
}
# defconf: accept in ipsec policy
:if ([/ip firewall filter print count-only where action=accept chain=forward comment="defconf: accept in ipsec policy" ipsec-policy="in,ipsec"]=0) do {
    :log info message="creating accept in ipsec policy"
    /ip firewall filter add action=accept chain=forward comment="defconf: accept in ipsec policy" ipsec-policy=in,ipsec
}
# defconf: accept out ipsec policy
:if ([/ip firewall filter print count-only where action=accept chain=forward comment="defconf: accept out ipsec policy" ipsec-policy="out,ipsec"]=0) do {
    :log info message="creating accept out ipsec policy"
    /ip firewall filter add action=accept chain=forward comment="defconf: accept out ipsec policy" ipsec-policy=out,ipsec
}
# defconf: fasttrack
:if ([/ip firewall filter print count-only where action=fasttrack-connection chain=forward comment="defconf: fasttrack" connection-state="established,related"]=0) do {
    :log info message="creating fasttrack"
    /ip firewall filter add action=fasttrack-connection chain=forward comment="defconf: fasttrack" connection-state=established,related
}
# defconf: accept established,related, untracked
:if ([/ip firewall filter print count-only where action=accept chain=forward comment="defconf: accept established,related, untracked" connection-state="established,related,untracked"]=0) do {
    :log info message="creating accept established,related, untracked"
    /ip firewall filter add action=accept chain=forward comment="defconf: accept established,related, untracked" connection-state=established,related,untracked
}
# defconf: drop invalid
:if ([/ip firewall filter print count-only where action=drop chain=forward comment="defconf: drop invalid" connection-state="invalid"]=0) do {
    :log info message="creating drop invalid"
    /ip firewall filter add action=drop chain=forward comment="defconf: drop invalid" connection-state=invalid
}
# defconf: drop all from WAN not DSTNATed
:if ([/ip firewall filter print count-only where action=drop chain=forward comment="defconf: drop all from WAN not DSTNATed" connection-nat-state="!dstnat" connection-state="new" in-interface-list="WAN"]=0) do {
    :log info message="creating drop all from WAN not DSTNATed"
    /ip firewall filter add action=drop chain=forward comment="defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat connection-state=new in-interface-list=WAN
}
# default firewall rules end