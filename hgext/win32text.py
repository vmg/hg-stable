
copyrev: d80aa1bbf05805ea5e114b99b28853988a971b39
copy: mercurial/ext/win32text.py

import mercurial.util

def dumbdecode(s, cmd):
    return s.replace('\n', '\r\n')

def dumbencode(s, cmd):
    return s.replace('\r\n', '\n')

def clevertest(s, cmd):
    if '\0' in s: return False
    return True

def cleverdecode(s, cmd):
    if clevertest(s, cmd):
        return dumbdecode(s, cmd)
    return s

def cleverencode(s, cmd):
    if clevertest(s, cmd):
        return dumbencode(s, cmd)
    return s

mercurial.util.filtertable.update({
    'dumbdecode:': dumbdecode,
    'dumbencode:': dumbencode,
    'cleverdecode:': cleverdecode,
    'cleverencode:': cleverencode,
    })
