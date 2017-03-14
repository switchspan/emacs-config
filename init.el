;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs.d/init.el'
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


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(message "* --[Loading my Emacs init file ]--")

(setq default-directory "~/")
(message "Default Dir: %S" default-directory)
(message "Current OS: %S" system-type)

;;* Prerequisites
(load "~/.emacs.d/init_font.el")
(load "~/.emacs.d/init_window.el")
(load "~/.emacs.d/init_packages.el")
(load "~/.emacs.d/init_keybindings.el")
(load "~/.emacs.d/init_org.el")
(load "~/.emacs.d/init_gnus.el")

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

(message "Emacs start time: %d seconds."
         (time-to-seconds (time-since emacs-load-start-time)))
(sit-for 1.5)

;; set the user settings
(setq user-full-name "Ken Taylor")
(setq user-mail-address "taylor.kenneth@gmail.com")

;; display the diary
(diary)

;; set the default browser to open links
;(setq browse-url-browser-function 'eww-browse-url) ; emacs browser

;; set all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; set the default markdown app location
;;(custom-set-variables
;; '(markdown-command "/usr/local/bin/pandoc"))

(message "-= End of the Emacs init =-")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (plantuml-mode jekyll-modes lua-mode kooten-theme magit)))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; change the theme
(load-theme 'kooten t)
