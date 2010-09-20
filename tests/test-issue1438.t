
copy: tests/test-issue1438
copyrev: 51e314c0e732a42ead6b88da12592aae1cc79b89

# http://mercurial.selenic.com/bts/issue1438

  $ "$TESTDIR/hghave" symlink || exit 80

  $ hg init

  $ ln -s foo link
  $ hg add link
  $ hg ci -mbad link
  $ hg rm link
  $ hg ci -mok
  $ hg diff -g -r 0:1 > bad.patch

  $ hg up 0
  1 files updated, 0 files merged, 0 files removed, 0 files unresolved

  $ hg import --no-commit bad.patch
  applying bad.patch

  $ hg status
  R link
  ? bad.patch

