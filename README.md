
## Running

In Daemon mode

```bash
# Create data directory
mkdir i2p-data
# Run docker command 'i2p' being the i2p service
docker run --rm  --name i2p -d=true \
    -p 7657:7657 \
    -v $PWD/i2p-data:/var/lib/i2p/i2p-config:rw \
    nolim1t/i2p
```

