#!/bin/sh
source "./assert.sh"

assert foo = foo
if [ $? -ne 0 ]; then
  echo "assert does not work"
  exit 1
fi

assert 1 -eq 2
if [ $? -ne 1 ]; then
  echo "assert does not work"
  exit 1
fi

assert_equal foo foo
if [ $? -ne 0 ]; then
  echo "assert_equal does not work"
  exit 1
fi

assert_equal 1 2 "1 does not equal 2"
if [ $? -ne 1 ]; then
  echo "assert_equal does not work"
  exit 1
fi

assert_exit 1 sh -c "exit 1"
if [ $? -ne 0 ]; then
  echo "assert_exit does not work"
  exit 1
fi

assert_exit 0 sh -c "exit 1"
if [ $? -ne 1 ]; then
  echo "assert_exit does not work"
  exit 1
fi
