
copy: tests/test-hghave
copyrev: 9f8e77868502a64ed9c63f0f8e86008224924b05

Testing that hghave does not crash when checking features

  $ "$TESTDIR/hghave" --test-features 2>/dev/null
