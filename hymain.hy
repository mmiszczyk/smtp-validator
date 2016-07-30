;this is a test program
;TODO: handling command line, pipes, file I/O, choice between active and passive mode

(import smtputils)

(-> (smtputils.get-domain-from-email "maciejmmiszczyk@google.com") (smtputils.has-mailserver) (print))