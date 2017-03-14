;; settings for org mode
(setq org-directory "~/Dropbox/org")

(setq org-default-notes-file (concat org-directory "/notes.org"))
     (define-key global-map "\C-cc" 'org-capture)

(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))

(setq org-tag-alist '(("@OFFICE" . ?o) ("@HOME" . ?h) ("COMPUTER" . ?c) ("PHONE" . ?p) ("READING" . ?r)))

;; set up RSS feeds
(setq org-feed-alist
          '(("Slashdot"
              "http://rss.slashdot.org/Slashdot/slashdot"
              "~/txt/org/feeds.org" "Slashdot Entries")))

