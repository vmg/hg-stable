
copy: tests/test-requires
copyrev: c447f47d61ceb17f5fe4f269204fd15e0075a4cc

  $ mkdir t
  $ cd t
  $ hg init
  $ echo a > a
  $ hg add a
  $ hg commit -m test -d "1000000 0"
  $ rm .hg/requires
  $ hg tip
  abort: index 00changelog.i unknown format 2!
  $ echo indoor-pool > .hg/requires
  $ hg tip
  abort: requirement 'indoor-pool' not supported!

  $ true
