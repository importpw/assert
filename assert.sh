assert() {
  if [ ! "$@" ]; then
    echo "assertion failed: ${message-$*}" >&2
    return 1
  fi
}

assert_equal() {
  if [ $# -ge 3 ]; then
    message="${3-}" assert "$1" = "$2"
  else
    assert "$1" = "$2"
  fi
}

assert_exit() {
  local code="$1"
  shift
  local actual=$("$@" >/dev/null; echo $?)
  message="\`$*\` exited with $actual, not $code" assert "$code" -eq "$actual"
}
