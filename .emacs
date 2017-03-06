;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs '
;;; ---------------------
;;;
;;; This is my own personal ~/.emacs
;;; Hopefully it will work in most situations
;;;
;;; Copyright (c) 2017 Kenneth Taylor
;;;
;;; Author: Kenneth Taylor, <taylor.kenneth@gmail.com> 2011
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; This file is NOT part of GNU Emacs.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

;; Set the emacs window to the upper left
(set-frame-position (selected-frame) 5 5)

;;* Prerequisites

(message "* --[Loading my Emacs init file ]--")

;; uptimes
(setq emacs-load-start-time (current-time))

;; Identify what parts of your `.emacs' take so long. You can do
;; this e.g. by starting emacs with "emacs -q", set up your
;; load-path, and then evaluate
;;
;; (benchmark-run
;;   (require 'package))
;;
;; The first number appearing in the echo area will be the time needed to run
;; that command.
;;
;; Use autoloads, which delay the loading of the complete package until one of
;; the interactive functions is used.
;;
;; If you want to set options which need to be evaluated after a package is
;; loaded, you can use `eval-after-load'.

;; ;; keep my secrets secret (and not in my `.emacs' file)
;; (let ((personal-settings "~/.hide/.emacs-secrets.gpg"))
;;   (when (file-exists-p personal-settings)
;;     (load personal-settings)))

;; ** Environment

;;; Add a load path for custom elisp files
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; load the individual settings files
(setq files-to-load
      '(archives
	tweaks
	appearance
	clojure
	ruby
	rails
	ecb
	js2
	markdown
	nav
	nxhtml
	snippets
	zencoding
	irc
	shortcuts
	organizer))

;; declare the function to load the settings file list
(defun load-config (f)
  (load (concat "~/.emacs.d/"
		(symbol-name f)
		".el")))

;; load up the config files
(mapcar 'load-config files-to-load)


(message "Emacs start time: %d seconds."
         (time-to-seconds (time-since emacs-load-start-time)))
(sit-for 1.5)

;; set the user settings
(setq user-full-name "Ken Taylor")
(setq user-mail-address "taylor.kenneth@gmail.com")

(message "-= End of the Emacs init =-")

