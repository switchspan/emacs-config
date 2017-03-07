;; load the package archives
;;(load "package")
(require 'package)

(message "Loading package archives")

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(package-initialize)
