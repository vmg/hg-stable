
copy: tests/test-rebuildstate
copyrev: c2736b2b78e9d336a3b4d022ac6d994a7796a702

basic test for hg debugrebuildstate

  $ hg init repo
  $ cd repo

  $ touch foo bar
  $ hg ci -Am 'add foo bar'
  adding bar
  adding foo

  $ touch baz
  $ hg add baz
  $ hg rm bar

  $ hg debugrebuildstate

state dump after

  $ hg debugstate --nodates | sort
  n 666         -1 bar
  n 666         -1 foo

status

  $ hg st -A
  ! bar
  ? baz
  C foo

