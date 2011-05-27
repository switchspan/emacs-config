;; loads in marmalade for emacs packages

(require 'package)

(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

;; Add the marmalade archive
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)