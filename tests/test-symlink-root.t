
copy: tests/test-symlink-root
copyrev: fa3744fe6663fe5518aa76383a8a959914028a0d

  $ "$TESTDIR/hghave" symlink || exit 80

  $ hg init a
  $ ln -s a link
  $ cd a
  $ echo foo > foo
  $ hg status
  ? foo
  $ hg status ../link
  ? foo
