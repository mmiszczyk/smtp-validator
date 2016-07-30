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

TODO
----
smtp-validator is a work in progress. Upcoming features:
+ command line argument handling
+ input/output with stdin/stdio as well as text files
+ choice between active and passive (no connection to SMTP server) mode


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