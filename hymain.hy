;this is a test program

;TODO: output, command line args

(import inputhandling smtputils)

(print (smtputils.check-host-list (inputhandling.read-hosts-from-stdin)))