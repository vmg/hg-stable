# sshrepo.py - ssh repository proxy class for mercurial
#
# Copyright 2005 Matt Mackall <mpm@selenic.com>
#
# This software may be used and distributed according to the terms
# of the GNU General Public License, incorporated herein by reference.

from node import *
from remoterepo import *
from i18n import gettext as _
from demandload import *
demandload(globals(), "hg os re stat")

class sshrepository(remoterepository):
    def __init__(self, ui, path):
        self.url = path
        self.ui = ui

        m = re.match(r'ssh://(([^@]+)@)?([^:/]+)(:(\d+))?(/(.*))?', path)
        if not m:
            raise hg.RepoError(_("couldn't parse destination %s") % path)

        self.user = m.group(2)
        self.host = m.group(3)
        self.port = m.group(5)
        self.path = m.group(7) or "."

        args = self.user and ("%s@%s" % (self.user, self.host)) or self.host
        args = self.port and ("%s -p %s") % (args, self.port) or args

        sshcmd = self.ui.config("ui", "ssh", "ssh")
        remotecmd = self.ui.config("ui", "remotecmd", "hg")
        cmd = '%s %s "%s -R %s serve --stdio"'
        cmd = cmd % (sshcmd, args, remotecmd, self.path)

        ui.note('running %s\n' % cmd)
        self.pipeo, self.pipei, self.pipee = os.popen3(cmd, 'b')

    def readerr(self):
        while 1:
            size = os.fstat(self.pipee.fileno())[stat.ST_SIZE]
            if size == 0: break
            l = self.pipee.readline()
            if not l: break
            self.ui.status(_("remote: "), l)

    def __del__(self):
        try:
            self.pipeo.close()
            self.pipei.close()
            # read the error descriptor until EOF
            for l in self.pipee:
                self.ui.status(_("remote: "), l)
            self.pipee.close()
        except:
            pass

    def dev(self):
        return -1

    def do_cmd(self, cmd, **args):
        self.ui.debug(_("sending %s command\n") % cmd)
        self.pipeo.write("%s\n" % cmd)
        for k, v in args.items():
            self.pipeo.write("%s %d\n" % (k, len(v)))
            self.pipeo.write(v)
        self.pipeo.flush()

        return self.pipei

    def call(self, cmd, **args):
        r = self.do_cmd(cmd, **args)
        l = r.readline()
        self.readerr()
        try:
            l = int(l)
        except:
            raise hg.RepoError(_("unexpected response '%s'") % l)
        return r.read(l)

    def lock(self):
        self.call("lock")
        return remotelock(self)

    def unlock(self):
        self.call("unlock")

    def heads(self):
        d = self.call("heads")
        try:
            return map(bin, d[:-1].split(" "))
        except:
            raise hg.RepoError(_("unexpected response '%s'") % (d[:400] + "..."))

    def branches(self, nodes):
        n = " ".join(map(hex, nodes))
        d = self.call("branches", nodes=n)
        try:
            br = [ tuple(map(bin, b.split(" "))) for b in d.splitlines() ]
            return br
        except:
            raise hg.RepoError(_("unexpected response '%s'") % (d[:400] + "..."))

    def between(self, pairs):
        n = "\n".join(["-".join(map(hex, p)) for p in pairs])
        d = self.call("between", pairs=n)
        try:
            p = [ l and map(bin, l.split(" ")) or [] for l in d.splitlines() ]
            return p
        except:
            raise hg.RepoError(_("unexpected response '%s'") % (d[:400] + "..."))

    def changegroup(self, nodes, kind):
        n = " ".join(map(hex, nodes))
        f = self.do_cmd("changegroup", roots=n)
        return self.pipei

    def addchangegroup(self, cg):
        d = self.call("addchangegroup")
        if d:
            raise hg.RepoError(_("push refused: %s"), d)

        while 1:
            d = cg.read(4096)
            if not d: break
            self.pipeo.write(d)
            self.readerr()

        self.pipeo.flush()

        self.readerr()
        l = int(self.pipei.readline())
        return self.pipei.read(l) != ""
