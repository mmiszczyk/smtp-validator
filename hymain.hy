;;;;;;;;;;;;;;;;;;;;;;;;;;
;                        ;
;     smtp-validator     ;
;                        ;
;     copyright 2016     ;
;   by Maciej Miszczyk   ;
;                        ;
;  this program is free  ;
;           and          ;
;  open source software  ;
; released under GNU GPL ;
;    (see COPYING for    ;
;    further details)    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(import inputhandling smtputils argparse)

;handle command line arguments
(setv parser (argparse.ArgumentParser
  :description "Validates SMTP servers (or e-mail addresses) by performing MX lookup and trying to connect. Outputs
  a list of working servers."))
(.add_argument parser "-i" "--input" :help "Input file (default: stdin)")
(.add_argument parser "-o" "--output" :help "Output file (default: stdout)")
(.add_argument parser "-p" "--passive" :action "store_true" :help "MX lookup only, don't connect to target server")
(setv arguments (.parse_args parser))

(if arguments.passive (setv func smtputils.resolve-mx)      ; lookup if passive
                      (setv func smtputils.has-mailserver)) ; lookup and connect if not
(setv results (smtputils.check-host-list
  (if arguments.input (inputhandling.read-hosts-from-file arguments.input) (inputhandling.read-hosts-from-stdin)) func))
; write to file or stdout
(if arguments.output (with [(setv f (open arguments.output "w+"))] (for [host results] (print host :file f)))
                                                                   (for [host results] (print host)))