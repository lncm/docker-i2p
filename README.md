# i2p in a docker container

## About

Credit goes to [docker-i2p](https://github.com/PrivacySolutions/docker-i2p) for some of the legwork. It was not quite fully working but thanks to [the debian instructions](https://geti2p.net/en/download/debian) have managed to get this working.
Will expend this further and support versioning.

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

