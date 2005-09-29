
copyrev: 79bd2e10567756efea8c5a37c31369910f170772
copy: mercurial/hg.py

# remoterepo - remote repositort proxy classes for mercurial
#
# Copyright 2005 Matt Mackall <mpm@selenic.com>
#
# This software may be used and distributed according to the terms
# of the GNU General Public License, incorporated herein by reference.

class remoterepository:
    def local(self):
        return False

class remotelock:
    def __init__(self, repo):
        self.repo = repo
    def release(self):
        self.repo.unlock()
        self.repo = None
    def __del__(self):
        if self.repo:
            self.release()
