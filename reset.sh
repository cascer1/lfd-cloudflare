#!/bin/bash
# Remove blocked and failed entries
# Making the script forget about current Cloudflare firewall entries
rm blocked; touch blocked
rm failed; touch failed
