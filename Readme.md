# assert

`assert` for bash.

## Example

```bash
#!/bin/bash
set -euo pipefail
eval "`curl -sfLS import.pw`"

import "git.io/assert@1.0.0"

assert.equal foo bar
# assertion error: foo = bar
```
