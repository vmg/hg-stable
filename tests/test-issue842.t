
copy: tests/test-issue842
copyrev: 13d1f72c75aa3087dd80d6c4f3c2577d0695dd41

# http://mercurial.selenic.com/bts/issue842

  $ hg init
  $ echo foo > a
  $ hg ci -Ama
  adding a

  $ hg up -r0000
  0 files updated, 0 files merged, 1 files removed, 0 files unresolved

  $ echo bar > a

Should issue new head warning:

  $ hg ci -Amb
  adding a
  created new head

  $ hg up -r0000
  0 files updated, 0 files merged, 1 files removed, 0 files unresolved

  $ echo stuffy > a

Should not issue new head warning:

  $ hg ci -q -Amc

  $ hg up -r0000
  0 files updated, 0 files merged, 1 files removed, 0 files unresolved

  $ echo crap > a
  $ hg branch testing
  marked working directory as branch testing

Should not issue warning:

  $ hg ci -q -Amd

