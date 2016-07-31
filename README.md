smtp-validator 0.1
==========================

About
-----
smtp-validator is a tool for filtering out fake or deactivated e-mail addresses
and servers. It does this by performing an MX lookup and attempting to establish
a connection with hosts to which the records point. smtp-validator will be of
use to system administrators as it allows removing non-existent addresses from
mailing lists and therefore limiting amount of needlessly sent e-mails.

smtp-validator was written in hy, a Lisp that works inside Python. It's a rewrite
of my earlier tools which performed the same operations through shell scripting
(bash on *nix systems, batch on Windows) and were therefore slow, ugly and not
portable.

Usage
-----
    usage: smtp-validator.py [-h] [-i INPUT] [-o OUTPUT] [-p]
    
    Validates SMTP servers (or e-mail addresses) by performing MX lookup and
    trying to connect. Outputs a list of working servers.
    
    optional arguments:
      -h, --help            show this help message and exit
      -i INPUT, --input INPUT
                            Input file (default: stdin)
      -o OUTPUT, --output OUTPUT
                            Output file (default: stdout)
      -p, --passive         MX lookup only, don't connect to target server

TODO
----
+ output e-mail addresses instead of just hosts
+ performance optimization
+ replace a few ugly hack with more elegant solutions

Author
------
smtp-validator was written by Maciej Miszczyk.

License
-------

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA