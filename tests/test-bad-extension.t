
copy: tests/test-bad-extension
copyrev: bd97af21eca3c5b6ca0c77531335cb31fb5a6347

  $ echo 'raise Exception("bit bucket overflow")' > badext.py
  $ abspath=`pwd`/badext.py

  $ echo '[extensions]' >> $HGRCPATH
  $ echo "gpg =" >> $HGRCPATH
  $ echo "hgext.gpg =" >> $HGRCPATH
  $ echo "badext = $abspath" >> $HGRCPATH
  $ echo "badext2 =" >> $HGRCPATH

  $ hg -q help help
  \*\*\* failed to import extension badext from .*/badext.py: bit bucket overflow
  \*\*\* failed to import extension badext2: No module named badext2
  hg help [TOPIC]
  
  show help for a given topic or a help overview
