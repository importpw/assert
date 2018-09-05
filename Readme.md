# assert

Assertion library for shell scripting.


## Example

```bash
#!/usr/bin/env import
import assert@2.1.3

assert_equal foo bar
# assertion error: foo = bar
```


## API

### `assert $test`

 * `message` - Optional message to print for the assertion failure. Prints the actual test if not specified.

Tests the given expression using bracket notation. This is very similar to the
built in `test` command, except that the an "assertion failed" message is printed
to stderr upon failure.

Returns 0 if the test passes, or 1 if the test fails.

```bash
#!/usr/bin/env import
import assert@2.1.3

assert 1 -eq 2
# assertion error: 1 -eq 2

message="one does not equal two" assert 1 -eq 2
# assertion error: one does not equal two
```

### `assert_equal $actual $expected`

Tests that the the _actual_ value is equal to the _expected_ value. Strings or
numbers may be used interchangeably, since the `=` operator is used under the
hood.

```bash
#!/usr/bin/env import
import assert@2.1.3

assert_equal foo bar
# assertion error: foo = bar
```

### `assert_exit $exit_code $command`

Tests that the given `command` exits with the specified `exit_code`.

```bash
#!/usr/bin/env import
import assert@2.1.3

# Passes
assert_exit 0 true

# This will fail
assert_exit 6 sh -c "exit 7"
# assertion failed: `sh -c exit 7` exited with 0, not 6
```
