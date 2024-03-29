#!/usr/bin/env bash

set -o errexit # exit when a command fails
set -o nounset # exit when using undeclared variables.
set -o pipefail # exit status of the last command that threw a non-zero exit code returns

# jq will ensure that the values are properly quoted
# and escaped for consumption by the shell.
eval "$(jq -r '@sh "IP=\(.ipv6)"')"

# retrieved from https://gist.github.com/lsowen/4447d916fd19cbb7fce4
function reverseIp6 {
    echo "$1" | awk -F: 'BEGIN {OFS=""; }{addCount = 9 - NF; for(i=1; i<=NF;i++){if(length($i) == 0){ for(j=1;j<=addCount;j++){$i = ($i "0000");} } else { $i = substr(("0000" $i), length($i)+5-4);}}; print}' | rev | sed -e "s/./&./g"
}

REVERSE=$(reverseIp6 $IP)"ip6.arpa."

jq -n --arg reverse "$REVERSE" '{"reversed":$reverse}'