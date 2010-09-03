
copy: tests/test-issue433
copyrev: 3c6e5320cca544776a0cfa30707ebfee0a0f4069

# http://mercurial.selenic.com/bts/issue433

  $ hg init
  $ echo a > a
  $ hg commit -Ama
  adding a

  $ hg parents -r 0 doesnotexist
  abort: 'doesnotexist' not found in manifest!

  $ true

