# SSH Proxy

_SSH Proxy_ is a ssh daemon you can start on your localhost. The daemon allows
tcp forwarding what makes it to a SSH Proxy.

## Getting stared

Generate a private / public key pair using `ssh-keygen`:

```bash
cd ~/.ssh
ssh-keygen -t ed25519 -b 4096 -C tunnel -f ~/.ssh/tunnel -N ''
```

The contents of tunnel.pub will be used as `PUBLIC_KEY`. To get the content you can run:

```bash
cat ~/.ssh/tunnel.pub
```

### Usage with `docker run`

To run the image you can execute the following command:

```bash
docker run \
  --name=ssh-proxy \
  --hostname=ssh-proxy \
  -d \
  -e PUBLIC_KEY="$(cat ~/.ssh/tunnel.pub)" \
  -p 2222:2222 \
  --restart unless-stopped \
  ethnexus/ssh-proxy
```

### Usage with `docker-compose`

Put the following service into you docker-compose.yml:

```yaml
version: "3"
services:
  sshd:
    image: ethnexus/ssh-proxy
    restart: unless-stopped
    ports:
      - 2222:2222
    environment:
      - PUBLIC_KEY=<your public key goes here>
```

Now you can compose your sshd:

```bash
docker-compose up -d
```

