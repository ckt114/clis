function setupServer() {
  cat >$config <<EOF
serverAddr: ${serverAddr}
serverPort: ${serverPort}
auth:
  method: token
  token: "{{ .Envs.FRP_TOKEN }}"
webServer:
  addr: ${webAddr}
  port: ${webPort}
EOF
}
