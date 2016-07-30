;;;;;;;;;;;;;;;;;;;;;;;;;;
;     inputhandling:     ;
; part of smtp-validator ;
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

(import smtputils sys)

; the following two functions are so similar there should be a macro here somewhere but I couldn't get it to work

(defn read-hosts-from-file[filename]
  (setv hosts (set)) ; this is a set now so it won't have duplicates
  (with [(setv f (open filename))] (for [line f]
    (.add hosts (.strip (smtputils.get-domain-from-email line)))))
  (list hosts)) ; but we return it as a list for easy removal of elements

(defn read-hosts-from-stdin[]
  (setv hosts (set))
  (for [line sys.stdin] (.add hosts (.strip (smtputils.get-domain-from-email line))))
  (list hosts))