# tunnel


tunnel is a wrapper for `frpc`, part of [frp](https://github.com/fatedier/frp), to expose local applications to the web with SSL support. Similar to [ngrok](https://ngrok.com/docs/getting-started/).


## Prerequisites


- [frps](https://github.com/fatedier/frp?tab=readme-ov-file#accessing-internal-web-services-with-custom-domains-in-lan) running with `vhostHTTPSPort` support.


## Usage


The below examples assume the following conditions are met

1. An `frps` server is accessible at frps.example.com on port 7000
1. Certificate `site.crt` and key `site.key` are in current directory
1. Top level domain (TLD) to create DNS for is `example.com`

Expose port 8080 using random subdomain like https://xkd0sl.example.com
```console
tunnel 8080 -t
```

Expose port 8080 on https://nginx.example.com and https://web.example.com
```console
tunnel 8080 -n nginx -n web
```

Connect to `frps` that requires token authentication
```console
tunnel 8080 -t TOKEN
```

Enable local web server UI accessible at http://localhost:7400
```console
tunnel 8080 -W
```

Use a different domain
```console
tunnel 8080 -n nginx -d mydomain.com
```

See all available options
```console
tunnel -h
```


## Environment Variables

Use the below environment variables to avoid repeatedly specifying needed flags

- `TUNNEL_AUTH_TOKEN` - The token to authenticate with `frps`
- `TUNNEL_SERVER_ADDR` - The `frps` server address to connect
- `TUNNEL_SERVER_PORT` - The `frps` server port to connect
- `TUNNEL_DOMAIN` - The domain to use to create accessible URLs
- `TUNNEL_SSL_CERT` - Path to the SSL certificate
- `TUNNEL_SSL_KEY` - Path to the SSL key

