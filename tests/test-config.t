
copy: tests/test-config-case.t
copyrev: e14e457fd66ceae46d28b6f0b843a6844666ada2

hide outer repo
  $ hg init

Test case sensitive configuration

  $ echo '[Section]' >> $HGRCPATH
  $ echo 'KeY = Case Sensitive' >> $HGRCPATH
  $ echo 'key = lower case' >> $HGRCPATH

  $ hg showconfig Section
  Section.KeY=Case Sensitive
  Section.key=lower case

