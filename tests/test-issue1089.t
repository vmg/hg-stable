
copy: tests/test-issue1089
copyrev: a5c2f12a26b199652cce59dc1eb061a33af6bc1e

# http://mercurial.selenic.com/bts/issue1089

  $ hg init
  $ mkdir a
  $ echo a > a/b
  $ hg ci -Am m
  adding a/b

  $ hg rm a
  removing a/b
  $ hg ci -m m a

  $ mkdir a b
  $ echo a > a/b
  $ hg ci -Am m
  adding a/b

  $ hg rm a
  removing a/b
  $ cd b

Relative delete:

  $ hg ci -m m ../a

