
copy: tests/test-revert-flags
copyrev: 74bef98bbf2f77198ccff7540458a245ba7f356f

  $ "$TESTDIR/hghave" execbit || exit 80

  $ hg init repo
  $ cd repo
  $ echo foo > foo
  $ chmod 644 foo
  $ hg ci -qAm '644'

  $ chmod 755 foo
  $ hg ci -qAm '755'

reverting to rev 0

  $ hg revert -a -r 0
  reverting foo
  $ hg st
  M foo
  $ hg diff --git
  diff --git a/foo b/foo
  old mode 100755
  new mode 100644
