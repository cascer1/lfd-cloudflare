# LFD to Cloudflare

Synchronize LFD blocks to Cloudflare

## Usage

1. Clone to any directory on your server
2. `chmod +x *.sh`
3. edit include.sh using comments for help
4. Edit csf.conf, set `BLOCK_REPORT` to the absolute path of block.sh and `UNBLOCK_REPORT` to the absolute path of unblock.sh

## secret.sh

The `secret.sh` file contains your cloudflare email and API key.

```
#!/bin/bash

key="abcdefg1234"
email="johndoe@example.com"
```
