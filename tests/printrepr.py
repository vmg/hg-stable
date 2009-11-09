
copyrev: 597803216f9b430af638a8a80d4317dee8ef122f
copy: tests/repr.py

#!/usr/bin/env python
#
# Copyright 2009 Matt Mackall <mpm@selenic.com> and others
#
# This software may be used and distributed according to the terms of the
# GNU General Public License version 2, incorporated herein by reference.

"""prints repr(sys.stdin) but preserves newlines in input"""

import sys
print repr(sys.stdin.read())[1:-1].replace('\\n', '\n'),
