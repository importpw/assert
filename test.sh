#!/bin/sh
set -eu
source "./assert.sh"


# assert
assert foo = foo

r=0
output="$(assert 1 -eq 2 2>&1)" || r=$?
if [ $r -ne 1 ]; then
  echo "assert does not work"
  exit 1
fi
assert_equal "$output" "assertion failed: 1 -eq 2"

r=0
output="$(message="it was bad" assert 1 = 2 2>&1)" || r=$?
if [ $r -ne 1 ]; then
  echo "assert does not work"
  exit 1
fi
assert_equal "$output" "assertion failed: it was bad"


# assert_equal
assert_equal foo foo
assert_equal "a b" "a b"
assert_equal "&" "&"
assert_equal "!" "!"

r=0
output="$(assert_equal foo bar 2>&1)" || r=$?
if [ $r -ne 1 ]; then
  echo "assert_equal does not work"
  exit 1
fi
assert_equal "$output" "assertion failed: foo = bar"

r=0
output="$(assert_equal 1 2 "1 does not equal 2" 2>&1)" || r=$?
if [ $r -ne 1 ]; then
  echo "assert_equal does not work"
  exit 1
fi
assert_equal "$output" "assertion failed: 1 does not equal 2"


# assert_exit
assert_exit 1 sh -c "exit 1"
assert_exit 0 echo foo

r=0
output="$(assert_exit 0 sh -c "exit 1" 2>&1)" || r=$?
if [ $r -ne 1 ]; then
  echo "assert_exit does not work"
  exit 1
fi
