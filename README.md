[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c58a87eed9684ac4a96825aca8bc4594)](https://www.codacy.com/app/cas-eliens/lfd-cloudflare?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=cascer1/lfd-cloudflare&amp;utm_campaign=Badge_Grade)

# LFD to Cloudflare

Synchronize LFD blocks to Cloudflare using CSF's `BLOCK_REPORT` and `UNBLOCK_REPORT` script triggers.

## Usage

1. Clone to any directory on your server
2. `chmod +x *.sh`
3. edit include.sh using comments for help
4. create secret.sh using example below
5. Edit csf.conf, set `BLOCK_REPORT` to the absolute path of block.sh and `UNBLOCK_REPORT` to the absolute path of unblock.sh

## secret.sh

The `secret.sh` file contains your cloudflare email and API key.

```
#!/bin/bash

key="abcdefg1234"
email="johndoe@example.com"
```

## Thanks

Thanks to Jeff @ Aetherweb for writing [this article](http://www.aetherweb.co.uk/automatically-adding-configserver-firewall-csf-firewall-blocks-to-cloudflare/), it helped me get started with this solution!

