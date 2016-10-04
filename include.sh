#!/bin/bash

# INCLUDE file for LFD cloudflare script
source secret.sh

# Script directory
# Can be either absolute (e.g: /etc/csf/scripts/cloudflare)
# Or relative to CSF directory (e.g: scripts/cloudflare)
dir="/etc/csf/scripts/cloudflare"

# Date format
# Used for rule description in Cloudflare
date=`date +%Y-%m-%d:%H:%M:%S`

# File names, relative to $dir
blocked="$dir/blocked"
failed="$dir/failed"
blocklog="$dir/block.log"
unblocklog="$dir/unblock.log"
