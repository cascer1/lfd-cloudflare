[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c58a87eed9684ac4a96825aca8bc4594)](https://www.codacy.com/app/cas-eliens/lfd-cloudflare?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=ducohosting/lfd-cloudflare&amp;utm_campaign=Badge_Grade)

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

## License

MIT License

Copyright (c) 2016 Duco Hosting

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
