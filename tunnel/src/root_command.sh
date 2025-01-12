[[ ${args[--debug]} -gt 0 ]] && inspect_args

setup

cat >$config <<EOF
serverAddr: ${serverAddr}
serverPort: ${serverPort}
auth:
  method: token
  token: "{{ .Envs.FRP_TOKEN }}"
webServer:
  addr: ${webAddr}
  port: ${webPort}

proxies:
- name: ${name}
  type: https
  customDomains: [ $(printf "%s, " "${customDomains[@]}") ]
  plugin:
    type: https2http
    localAddr: ${localAddr}:${port}
    crtPath: ${sslCert}
    keyPath: ${sslKey}
    hostHeaderRewrite: ${localAddr}
    requestHeaders:
      set:
        x-from-where: frp
EOF

connect https
