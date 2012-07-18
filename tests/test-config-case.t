
copy: tests/test-config-case
copyrev: 33d4f7f1af18f73cf7ce75e6a5815383d27daaec

  $ echo '[Section]' >> $HGRCPATH
  $ echo 'KeY = Case Sensitive' >> $HGRCPATH
  $ echo 'key = lower case' >> $HGRCPATH

  $ hg showconfig Section
  Section.KeY=Case Sensitive
  Section.key=lower case

