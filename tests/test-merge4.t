
copy: tests/test-merge4
copyrev: f33948abf5441c39c67f8d6bfb6d0059f0da2010

  $ hg init
  $ echo This is file a1 > a
  $ hg add a
  $ hg commit -m "commit #0" -d "1000000 0"
  $ echo This is file b1 > b
  $ hg add b
  $ hg commit -m "commit #1" -d "1000000 0"
  $ hg update 0
  0 files updated, 0 files merged, 1 files removed, 0 files unresolved
  $ echo This is file c1 > c
  $ hg add c
  $ hg commit -m "commit #2" -d "1000000 0"
  created new head
  $ hg merge 1
  1 files updated, 0 files merged, 0 files removed, 0 files unresolved
  (branch merge, don't forget to commit)
  $ rm b
  $ echo This is file c22 > c
  $ hg commit -m "commit #3" -d "1000000 0"

