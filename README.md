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