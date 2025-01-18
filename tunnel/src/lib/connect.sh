function connect() {
  echo
  if [[ $1 == "https" ]]; then
    for d in "${customDomains[@]}"; do
      echo "Visit ${1}://${d} to see your application."
    done
  else
    echo "TCP application accessible at ${serverAddr} on port ${remotePort}."
  fi
  echo

  # Cleanup old configs
  find -H $workdir -name "frpc_*" -mmin +1 -exec rm {} \;

  $frpcBin -c $config
}
