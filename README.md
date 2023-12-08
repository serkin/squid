# Squid

Runs Squid on a given server

```bash
curl -sSL https://raw.githubusercontent.com/serkin/squid/main/install.sh | -s "3111"
```

## Testing
```bash
curl ipinfo.io/ip
IP=
export ftp_proxy=http://$IP:3111
export http_proxy=http://$IP:3111
export https_proxy=http://$IP:3111

curl ipinfo.io/ip
``````


## Tinyproxy
docker run -d --name='tinyproxy' -p 6666:8888 monokal/tinyproxy:latest ANY

- https://hub.docker.com/r/ajoergensen/tinyproxy
- https://hub.docker.com/r/kalaksi/tinyproxy
- https://github.com/kalaksi/docker-tinyproxy

