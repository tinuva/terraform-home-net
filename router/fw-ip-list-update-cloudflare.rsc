# Written by Shumkov
# Adapted by addresslister
# 20210407
{
/ip firewall address-list
:local update do={
 :do {
 :local result [/tool fetch url=$url as-value output=user]; :if ($result->"downloaded" != "63") do={ :local data ($result->"data")
  :do { remove [find list=$addresslist] } on-error={}

   :while ([:len $data]!=0) do={
      :if ([:pick $data 0 1] = "#") do={ :set $Comment [:pick $data 2 [:find $data "\n"]] } 
      :if ([:pick $data 0 [:find $data "\n"]]~"^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}") do={
      :do {add list=$addresslist comment=$Comment address=([:pick $data 0 [:find $data $delimiter]].$cidr)} on-error={}
     }
   :set data [:pick $data ([:find $data "\n"]+1) [:len $data]]
   } ;  :log warning "Imported address list < $addresslist> from file: $url"
   } else={:log warning "Address list: <$addresslist>, downloaded file to big: $url" }
 } on-error={:log warning "Address list <$addresslist> update failed"}
}
$update url=https://www.cloudflare.com/ips-v4 addresslist="CloudFlare" delimiter=("\n") 
}