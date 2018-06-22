#!/bin/bash

assert() {
  if [ ! "$@" ]; then
    echo "assertion failed: $*" >&2
    return 1
  fi
}
