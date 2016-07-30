;;;;;;;;;;;;;;;;;;;;;;;;;;
;       smtputils:       ;
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

; TODO: choice between active and passive checking

(import dns.resolver socket) ; dns.resolver to get MX records, socket to attempt connection

(defn get-domain-from-email[email]
  (-> (.split email "@") (last)))

; queries DNS server for MX records and returns a list
; returns nil if no records exist or NXDOMAIN
(defn resolve-mx[domain]
  (setv recordlist (try
    (dns.resolver.query domain "MX")
  (except [e dns.exception.DNSException] nil))) ; domain doesn't exist
  (lif recordlist
    (list-comp (-> (.to_text record) (.split) (last)) [record recordlist])
    nil)) ; no MX records

(defn check-smtp[host &optional [port 25]]
  (try
    ((setv ip-port-tuple (, (socket.gethostbyname host) port))
    (if(-> (socket.socket socket.AF_INET socket.SOCK_STREAM) (.connect_ex ip-port-tuple))
      nil ; connect_ex returns 0 on success, therefore (if) block will evaluate to false on success and to true on error
      True))
  (except [e socket.gaierror] nil)
  (except [e TypeError] True))) ; ugly hack, fix later

; get MX records, then check if servers are online
; returns True if there are records and at least one of them allows connection on specified SMTP port (default 25)
(defn has-mailserver[domain &optional [port 25]]
  (setv records (resolve-mx domain))
  (setv ret nil)
  (if records
    (for [record records]                                    ; I wanted to do it with recursion but couldn't get it
      ((setv ret (check-smtp record port))(lif ret (break))) ; to work so I used (for)
    ))ret)                                                   ; I'm not sure if it's my fault or some hy quir