#!/usr/bin/env bash

set -o errexit # exit when a command fails
set -o nounset # exit when using undeclared variables.
set -o pipefail # exit status of the last command that threw a non-zero exit code returns

# jq will ensure that the values are properly quoted
# and escaped for consumption by the shell.
eval "$(jq -r '@sh "MAC=\(.ipv6)"')"

mac_to_ipv6_ll() {
    IFS=':'; set $1; unset IFS
    echo "$(printf %02x $((0x$1 ^ 2)))$2:${3}ff:fe$4:$5$6"
}

mac_to_eui64() {
 IFS=':'; set $1; unset IFS
 echo "$(printf %x $((0x$1 ^ 2)))$2:${3}ff:fe$4:$5$6" |
  sed -E 's/:0+/:/g; s/:{3,}/::/; s/:$/:0/'
}

IPV6=$(mac_to_eui64 $MAC)

jq -n --arg ipv6 "$IPV6" '{"ipv6":$ipv6}'