#!/bin/bash

# This script - is triggered by the user or a cron job
# 	      - attempts to remove blocks from cloudflare after they were removed from LFD but
#		could not be removed from cloudflare for some reason
# 	      - Looks for the cloudflare rule ID in a file named 'failedUnblocks'
# 	      - Saves the IP and cloudflare rule ID to a file named 'blocked' in the format ip|id

# Directory of THIS script, used for includes.
dir="/etc/csf/scripts/cloudflare"

# Include file, contains api key and other settings
source "$dir/include.sh"

ip=$(printf "%q" $1)

# Get cloudflare rule ID from log
id=$(sed -n "s/^$ip|//p" "$failed")
idsize=${#id}

# Remove block from log
sed --in-place "/^$ip.*$/d" "$failed"
echo $id
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
		echo "$ip|$id" >> "$failed"
	
		echo "========================" >> "$unblocklog"
		echo "'$date' -- '$ip': '$id'" >> "$unblocklog"
		echo "$response" >> "$unblocklog"
		echo "" >> "$unblocklog"
	fi
fi
