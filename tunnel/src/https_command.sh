[[ ${args[--debug]} -gt 0 ]] && inspect_args

setupVars
setupServer

cat >>$config <<EOF
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
