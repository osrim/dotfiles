zj() {
  case "$1" in
    new)
      zellij --session
      ;;
    kill)
      zellij kill-session
      ;;
    killall)
      zellij kill-all-sessions
      ;;
    *)
      zellij "$@"
      ;;
  esac
}

killit() {
  if [ $# -ne 1 ]; then
    echo "Usage: port <port_number>"
    return 1
  fi

  local port_number="$1"
  local process_info

  process_info=$(lsof -i :$port_number | grep LISTEN)

  if [ -z "$process_info" ]; then
    echo "No process found listening on port $port_number"
    return 1
  fi

  local pid
  pid=$(echo "$process_info" | awk '{print $2}')

  echo "Process using port $port_number:"
  echo "$process_info"

  read -q "confirm?Do you want to kill the process using this port? (y/n): "

  if [[ "$confirm" == "y" ]]; then
    kill -9 "$pid"
    echo "Process with PID $pid has been killed."
  else
    echo "Process with PID $pid was not killed."
  fi
}

mkcd () {
  \mkdir -p "$1"
  cd "$1"
}
