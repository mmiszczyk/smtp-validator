;this is a test program

;TODO: output, command line args

(import inputhandling smtputils argparse)

;(print (smtputils.check-host-list (inputhandling.read-hosts-from-stdin)))
;(print (smtputils.check-host-list (inputhandling.read-hosts-from-stdin) smtputils.resolve-mx))
(setv parser (argparse.ArgumentParser
  :description "Validates SMTP servers (or e-mail addresses) by performing MX lookup and trying to connect. Outputs
  a list of working servers or addresses associated with them."))
(.add_argument parser "-i" "--input" :help "Input file (default: stdin)")
(.add_argument parser "-o" "--output" :help "Output file (default: stdout)")
(.add_argument parser "-p" "--passive" :action "store_true" :help "MX lookup only, don't connect to target server")
(.parse_args parser)