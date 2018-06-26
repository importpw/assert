#!/bin/sh
source "./assert.sh"

assert 1 -eq 2
assert_equal 1 2 "1 does not equal 2"
