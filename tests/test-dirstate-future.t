
copy: tests/test-dirstate-future
copyrev: c36393a53f3427e6e7bd892874030ace24204e88

Prepare test repo:

  $ hg init
  $ echo a > a
  $ hg add
  adding a
  $ hg ci -m1

Set mtime of a into the future:

  $ touch -t 202101011200 a

Status must not set a's entry to unset (issue1790):

  $ hg status
  $ hg debugstate
  n 644          2 2021-01-01 12:00:00 a

