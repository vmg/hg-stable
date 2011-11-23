
copy: tests/test-check-code-hg.py
copyrev: b4ea1d56475ac82d3288e2fcaa66b9dcf7ad93b2

  $ check_code="$TESTDIR"/../contrib/check-code.py
  $ cd "$TESTDIR"/..

  $ "$check_code" `hg manifest` | grep . && echo 'FAILURE IS NOT AN OPTION!!!'
  [1]

