:global shost000000000001 "router"
:global shost000000000002 "ha"
:global shost000000000003 "wiki"
:global shost000000000004 "sonarr"
:global shost000000000005 "radarr"
:global shost000000000006 "tasmoadmin"
:global shost000000000007 "traefik"
:global shost000000000008 "netmon"
:global shost000000000009 "plex"
:global shost000000000010 "comms"
:global shost000000000011 "unifi"
:global shost000000000012 "dns"
:global shost000000000013 "sabnzbd"
:global shost000000000014 "transmission"
:global shost000000000015 "sync"
:global shost000000000016 "hydra"
:global shost000000000017 "hydra2"
:global shost000000000018 "adguardhome"
:global shost000000000019 "zoneminder"
:global shost000000000020 "grafana"
:global shost000000000021 "tasmoadmin"
:global shost000000000022 "traefik"
:global shost000000000023 "nodered"
:global shost000000000024 "zha"
:global shost000000000025 "bastion"
:global shost000000000026 "ebucks"
:global shost000000000027 "nodejswatch"
:global shost000000000028 "spotweb"
:global shost000000000029 "tasmobackup"
:global shost000000000030 "overseerr"
:global shost000000000031 "kibana"
:global shost000000000032 "bi"
:global shost000000000033 "pve-nuc"

:local zone "heaven.za.net";
:local ttl "00:15:00"
:local hostname
:local ip
:local dnsip
:local dhcpip
:local dnsnode
:local dhcpnode

/ip dns static;
:foreach i in=[find where name ~ (".*\\.".$zone) ] do={
    :set hostname [ get $i name ];
    :set hostname [ :pick $hostname 0 ( [ :len $hostname ] - ( [ :len $zone ] + 1 ) ) ];
    /ip dhcp-server lease;
    :set dhcpnode [ find where host-name=$hostname ];
    :if ( [ :len $dhcpnode ] > 0) do={
    :log debug ("Lease for ".$hostname." still exists. Not deleting.");
    } else={
# there's no lease by that name. Maybe this mac has a static name.
    :local found false
    /system script environment
    :foreach n in=[ find where name ~ "shost[0-9A-F]+" ] do={
        :if ( [ get $n value ] = $hostname ) do={
        :set found true;
        }
    }
    :if ( found ) do={
        :log debug ("Hostname ".$hostname." is static");
    } else={
        :log info ("Lease expired for ".$hostname.", deleting DNS entry.");
        /ip dns static remove $i;
    }
    }
}

/ip dhcp-server lease;
:foreach i in=[find] do={
    :set hostname ""
    :local mac
    :set dhcpip [ get $i address ];
    :set mac [ get $i mac-address ];
    :while ($mac ~ ":") do={
    :local pos [ :find $mac ":" ];
    :set mac ( [ :pick $mac 0 $pos ] . [ :pick $mac ($pos + 1) 999 ] );
    };
    :foreach n in=[ /system script environment find where name=("shost" . $mac) ] do={
    :set hostname [ /system script environment get $n value ];
    }
    :if ( [ :len $hostname ] = 0) do={
    :set hostname [ get $i host-name ];
    }
    :if ( [ :len $hostname ] > 0) do={
    :set hostname ( $hostname . "." . $zone );
    /ip dns static;
    :set dnsnode [ find where name=$hostname ];
    :if ( [ :len $dnsnode ] > 0 ) do={
# it exists. Is its IP the same?
        :set dnsip [ get $dnsnode address ];
        :if ( $dnsip = $dhcpip ) do={
        :log debug ("DNS entry for " . $hostname . " does not need updating.");
        } else={
        :log info ("Replacing DNS entry for " . $hostname);
        /ip dns static remove $dnsnode;
        /ip dns static add name=$hostname address=$dhcpip ttl=$ttl;
        }
    } else={
# it doesn't exist. Add it
        :log info ("Adding new DNS entry for " . $hostname);
        /ip dns static add name=$hostname address=$dhcpip ttl=$ttl;
    }
    }
}