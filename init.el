;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs'
;;; ---------------------
;;;
;;; This is my personal emacs init
;;; Hopefully it will work in most situations
;;;
;;; Copyright (c) 2017 Kenneth Taylor
;;;
;;; Author: Kenneth Taylor, <taylor.kenneth@gmail.com>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; This file is NOT part of GNU Emacs.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

;; Set the emacs window to the upper left
;;(set-frame-position (selected-frame) 5 5)


;; set default font in initial window and for any new window
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (when (member "Consolas" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "Consolas-14"))
    (add-to-list 'default-frame-alist '(font . "Consolas-14"))))
 ((string-equal system-type "darwin") ; Mac OS X
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-10"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))))
 ((string-equal system-type "gnu/linux") ; linux
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-10"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10")))))


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

(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(message "Emacs start time: %d seconds."
         (time-to-seconds (time-since emacs-load-start-time)))
(sit-for 1.5)

;; set the user settings
(setq user-full-name "Ken Taylor")
(setq user-mail-address "taylor.kenneth@gmail.com")

(message "-= End of the Emacs init =-")

