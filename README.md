# alpine-xmrig
[XMRig miner](https://github.com/xmrig/xmrig) in an Alpine Linux Docker image.

The goal of this project is to quickly enable you to mine Monero without the hassle of knowing how to install or secure your mining software. 

Using an [Alpine Linux](https://www.alpinelinux.org/) container you get a very lightweight image ~4MB and the benefit of Alpine Linux's security model.

# How to use
```bash
# docker run --restart unless-stopped --read-only -m 50M -c 512 marcdibold/alpine-xmrig -o POOL01 -o POOL02 -u WALLET -p PASSWORD -k
# docker run --restart unless-stopped --read-only -m 50M -c 512 marcdibold/alpine-xmrig -o pool.supportxmr.com:5555 -u 4Ab2PkxXryVdbp5Q2WMw5J6dSTivt6kfkWLeRPmQNDKBNWKuxXCceFWPf6e6Z8FMs49kUt5gQVHKqEoB4QEcgWcvDPnxKiy -p x -k
```

## Docker Arguments
`--restart unless-stopped`

If the miner crashes we want the docker service to restart it.

`--read-only`

This image does not need rw access.
If there are bug/exploits in the pool/software you are a little more protected.

#### `-m 50M`

Restricts memory usage to 50MB.

#### `-c 512`

By default XMRig will use <= half of your cores.
Setting a relevant share count will protect you from a runaway process locking your system.

## XMRig Arguments
#### `--help`

All standard XMRig arguments are supported, using `--help` will list all of them.
```bash
# docker run marcdibold/alpine-xmrig --help
```

#### `-t`

When manually setting threads with `-t` you need to configure the correct CPU shares for docker.

IE if you have 4 cores each core is worth 256 `( 1024 / 4 )` and so to use 3 threads, CPU shares will need to be set to 756.
```bash
# docker run -c 756 marcdibold/alpine-xmrig ... -t 3
```

## Developer Donation
###### marcdibold: 
```
XMR: 4Ab2PkxXryVdbp5Q2WMw5J6dSTivt6kfkWLeRPmQNDKBNWKuxXCceFWPf6e6Z8FMs49kUt5gQVHKqEoB4QEcgWcvDPnxKiy
AEON: WmsCW81aCcXh86FE8VmxeqYY5XJXyDkVaXHpCo7JMgd72gTmS4cJajwLpLb1mDua2uUaiVbMfTxHgQH2XeeKyj6d1KqUyDPCB
```

###### b-i-t-n: 
```
XMR: 45CJVagd6WwQAQfAkS91EHiTyfVaJn12uM4Su8iz6S2SHZ3QthmFM9BSPHVZY388ASWx8G9Wbz4BA24RQZUpGczb35fnnJz
```


