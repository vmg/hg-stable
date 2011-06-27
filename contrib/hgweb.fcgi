
copy: contrib/hgwebdir.fcgi
copyrev: b19e9226423fc45fc95021ac277a5e0940b3d4f9

#!/usr/bin/env python
#
# An example FastCGI script for use with flup, edit as necessary

# Path to repo or hgweb config to serve (see 'hg help hgweb')
config = "/path/to/repo/or/config"

# Uncomment and adjust if Mercurial is not installed system-wide:
#import sys; sys.path.insert(0, "/path/to/python/lib")

# Uncomment to send python tracebacks to the browser if an error occurs:
#import cgitb; cgitb.enable()

from mercurial import demandimport; demandimport.enable()
from mercurial.hgweb import hgweb
from flup.server.fcgi import WSGIServer
application = hgweb(config)
WSGIServer(application).run()
