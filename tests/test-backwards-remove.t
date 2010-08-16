
copy: tests/test-backwards-remove
copyrev: afde4aaef0125cc0c69c052d8bdb1dd276a5577b

  $ hg init
  $ echo This is file a1 > a
  $ hg add a
  $ hg commit -m "commit #0" -d "1000000 0"
  $ ls
  a
  $ echo This is file b1 > b
  $ hg add b
  $ hg commit -m "commit #1" -d "1000000 0"
  $ hg co 0
  0 files updated, 0 files merged, 1 files removed, 0 files unresolved

B should disappear

  $ ls
  a
