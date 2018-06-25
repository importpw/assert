#!/bin/bash
source "./assert.sh"

assert 1 -eq 2
assert.equal 1 2 "1 does not equal 2"
