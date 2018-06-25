#!/bin/bash
assert() {
  if [ ! "$@" ]; then
    echo "assertion failed: ${message-$*}" >&2
    return 1
  fi
}

assert.equal() {
  if [ $# -ge 3 ]; then
    message="${3-}" assert "$1" = "$2"
  else
    assert "$1" = "$2"
  fi
}
