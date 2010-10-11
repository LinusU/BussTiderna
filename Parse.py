#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# © Linus Unnebäck
#

from re import compile
from sys import stdin

import sqlite3

reg = compile('value\=\"([^\"\>\<\|]+)\|([0-9]+)\"\>([^\"\>\<\|]+)\<\/option\>')
conn = sqlite3.connect("stops.sqlite")
rows = 0

for line in stdin:
    
    m = reg.search(line)
    
    if m is not None:
        
        l, v = m.group(1, 2)
        
        #if v[:2] != "60": continue
        
        c = conn.cursor()
        
        c.execute("SELECT * FROM `stops` WHERE `value`=? AND `label`=?", (v.decode('utf-8'), l.decode('utf-8')))
        
        if c.fetchone() is None:
            c.execute("INSERT INTO `stops` (`value`, `label`, `priority`) VALUES(?, ?, 0)", (v.decode('utf-8'), l.decode('utf-8')))
            rows += 1
        
    

conn.commit()

print("%u rows added..." % (rows, ))
