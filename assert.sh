assert() {
  if [ ! "$@" ]; then
    echo "assertion failed: ${message-$*}" >&2
    return 1
  fi
}

assert_equal() {
  message="${3-}" assert "$1" = "$2"
}

assert_exit() {
  local code="$1"
  shift
  local actual=$("$@" >/dev/null && echo 0 || echo $?)
  message="\`$*\` exited with $actual, not $code" assert "$code" -eq "$actual"
}
