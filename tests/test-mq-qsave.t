
copy: tests/test-mq-qsave
copyrev: b3a05551368d8728f231936f645b8e39bda1451e

  $ echo "[extensions]" >> $HGRCPATH
  $ echo "mq=" >> $HGRCPATH

  $ hg init

  $ echo 'base' > base
  $ hg ci -Ambase
  adding base

  $ hg qnew -mmqbase mqbase

  $ hg qsave
  $ hg qrestore 2
  restoring status: hg patches saved state

