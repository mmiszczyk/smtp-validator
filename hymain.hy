;this is a test program
;TODO: handling command line, pipes, file I/O, choice between active and passive mode

(import smtputils)

(defn read-hosts-from-file[filename]
  (setv hosts (set)) ; this is a set now so it won't have duplicates
  (with [(setv f (open filename))] (for [line f]
    (.add hosts (.strip (smtputils.get-domain-from-email line)))))
  (list hosts)) ; but we return it as a list for easy removal of elements

(defn check-host-list[hosts]
  (for [hostname hosts] (if-not (smtputils.check-smtp hostname) (hosts.remove hostname))) hosts)

;(-> (smtputils.get-domain-from-email "maciejmmiszczyk@google.com") (smtputils.has-mailserver) (print))
(print (check-host-list(read-hosts-from-file "test")))