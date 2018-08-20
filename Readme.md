# assert

`assert` for shell scripts.

## Example

```bash
#!/bin/sh
eval "`curl -sfLS import.pw`"

import assert@2.1.2

assert_equal foo bar
# assertion error: foo = bar
```
