;; loads in emacs package archives

(require 'package)

;; create archives adding elpa
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

;; Add the marmalade archive
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Add the melpa archive
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)
