function setup() {
  port=${args[port]}

  authToken=${args[--auth-token]:-$TUNNEL_AUTH_TOKEN}
  serverAddr=${args[--server-addr]:-$TUNNEL_SERVER_ADDR}
  serverPort=${args[--server-port]:-$TUNNEL_SERVER_PORT}
  domain=${args[--domain]:-$TUNNEL_DOMAIN}
  sslCert=${args[--ssl-cert]:-$TUNNEL_SSL_CERT}
  sslKey=${args[--ssl-key]:-$TUNNEL_SSL_KEY}
  localAddr=${args[--local-addr]}

  webAddr=${args[--web-addr]}

  # Use --web-port if set, otherwise use 7400 if only --web is set
  webPort=${args[--web-port]}
  [[ -z "$webPort" && ${args[--web]} ]] && webPort=7400

  # Create an array of names from multi-value --name flag
  # If --name is not set, then create a random 6-digit name
  names=(${args[--name]})
  if [[ "${#names[@]}" -eq 0 ]]; then
    names=($(cat /dev/urandom | LC_ALL=C tr -dc 'a-z0-9' | fold -w 6 | head -n 1))
  fi

  name=${names[0]}

  # Create an array of FQDNs from --name and --domain flags
  customDomains=()
  for n in "${names[@]}"; do
    customDomains+=("${n}.${domain}")
  done

  export FRP_TOKEN=$authToken

  workdir=/tmp

  config="${workdir}/frpc_$(date +%s).yaml"
}
