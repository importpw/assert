#!/bin/sh
set -eu
source "./assert.sh"


# assert
assert foo = foo
if [ $? -ne 0 ]; then
  echo "assert does not work"
  exit 1
fi

r=0
assert 1 -eq 2 || r=$?
if [ $r -ne 1 ]; then
  echo "assert does not work"
  exit 1
fi


# assert_equal
assert_equal foo foo
if [ $? -ne 0 ]; then
  echo "assert_equal does not work"
  exit 1
fi

r=0
assert_equal 1 2 "1 does not equal 2" || r=$?
if [ $r -ne 1 ]; then
  echo "assert_equal does not work"
  exit 1
fi

assert_equal "a b" "a b"
if [ $? -ne 0 ]; then
  echo "assert_equal does not work"
  exit 1
fi

assert_equal "&" "&"
if [ $? -ne 0 ]; then
  echo "assert_equal does not work"
  exit 1
fi

assert_equal "!" "!"
if [ $? -ne 0 ]; then
  echo "assert_equal does not work"
  exit 1
fi


# assert_exit
assert_exit 1 sh -c "exit 1"
if [ $? -ne 0 ]; then
  echo "assert_exit does not work"
  exit 1
fi

r=0
assert_exit 0 sh -c "exit 1" || r=$?
if [ $r -ne 1 ]; then
  echo "assert_exit does not work"
  exit 1
fi

assert_exit 0 echo foo
if [ $? -ne 0 ]; then
  echo "assert_exit does not work"
  exit 1
fi
