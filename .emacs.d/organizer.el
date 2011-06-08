;; This loads all of the code needed for emacs org mode (orgmode.org)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; check to see what OS we are running and adjust the paths accordingly
(when running-ms-windows
  (setq dropbox-path "~/Documents/My Dropbox/MobileOrg"))

;; TODO: fix this when I am on the mac
(when running-mac-osx
  (setq dropbox-path "~/My Dropbox/"))

(when running-gnu-linux
  (setq dropbox-path "~/Dropbox/"))

;; set the agenda files variable
(setq org-agenda-files (list "~/org/mygtd.org"
			     "~/org/agendas.org"))

;; add additional calls for MobileOrg (iPad/iPhone)
;; Set to the location of your Org files on your local system
;;(setq org-directory "~/org/")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory dropbox-path)
;; Set the agenda files for Org
;;(setq org-agenda-files "~/org/agenda.org")

;; cut off the property drawer for the agenda files
(setq org-mobile-force-id-on-agenda-items nil)

;; add org keywords for todo
(setq org-todo-keywords
      '((type "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "|" "CANCELLED(c)" "DEFERRED(e)" "DONE(d)")
	(sequence "PROJECT(p)" "|" "FINISHED(f)")
	(sequence "INVOICE(i)" "SENT(s)" "|" "RCVD(r)")))



;; set a function to load the gtd file into a buffer
(defun gtd ()
    (interactive)
    (find-file (expand-file-name "~/org/mygtd.org")))


