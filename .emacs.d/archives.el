;; loads in emacs package archives

(require 'package)

;; create archives adding elpa
;;(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

;; Add the marmalade archive
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

(package-initialize)
