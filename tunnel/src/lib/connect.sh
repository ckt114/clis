function connect() {
  echo
  for d in "${customDomains[@]}"; do
    echo "Visit ${1}://${d} to see your application."
  done
  echo

  # Cleanup old configs
  find -H $workdir -name "frpc_*" -mmin +1 -exec rm {} \;

  $frpcBin -c $config
}
