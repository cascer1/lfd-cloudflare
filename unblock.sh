#!/bin/bash

# This script - is triggered by LFD (UNBLOCK_REPORT)
# 	      - removes previously blocked IP addresses from the cloudflare user-level firewall
# 	      - logs errors to $unblocklog
# 	      - logs failed IP's and rule ID's in $failed

# Directory of THIS script, used for includes.
dir="/etc/csf/scripts/cloudflare"

# Include file, contains api key and other settings
source "$dir/include.sh"

ip=$(printf "%q" $1)

# Get cloudflare rule ID from log
id=$(sed -n "s/^$ip|//p" "$blocked" | sed -n "s/|||.*$//p")
idsize=${#id}

# Remove block from log
sed --in-place "/^$ip.*$/d" "$blocked"

if [ $idsize == 32 ]; then
	# Send delete request to cloudflare
	response=$(curl --silent --request DELETE "https://api.cloudflare.com/client/v4/user/firewall/access_rules/rules/$id" \
		-H "X-Auth-Email: $email" \
		-H "X-Auth-Key: $key" \
		-H "Content-Type: application/json")
	
	# See if request succeeded
	success=$(echo "$response" | jq -r '.["success"]')


	# If request failed, keep track of IP in separate log
	# And log response
	if [ "$success" != "true" ]; then
		echo "$ip|$id" >> "$unblocklog"
	
		echo "========================" >> "$unblocklog"
		echo "'$date' -- '$ip': '$id'" >> "$unblocklog"
		echo "$response" >> "$unblocklog"
		echo "" >> "$unblocklog"
	fi
fi
