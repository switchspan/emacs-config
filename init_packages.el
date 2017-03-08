;; load the package archives
;;(load "package")
(require 'package)

;; requires emacs > 24
(message "Loading package archives")

; list the packages you want
(setq package-list '(dash magit kooten-theme))

; list the repositories containing them
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(setq package-archive-enable-alist '(("melpa" deft magit)))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
