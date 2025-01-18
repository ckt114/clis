[[ ${args[--debug]} -gt 0 ]] && inspect_args

setupVars
setupServer

cat >>$config <<EOF
proxies:
- name: ${name}
  type: tcp
  localIP: ${localAddr}
  localPort: ${port}
  remotePort: ${remotePort}
EOF

connect tcp
