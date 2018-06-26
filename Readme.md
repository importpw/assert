# assert

`assert` for shell scripts.

## Example

```bash
#!/bin/sh
eval "`curl -sfLS import.pw`"

import "git.io/assert@2.1.1"

assert_equal foo bar
# assertion error: foo = bar
```
