;; load the package archives
;;(load "package")

(message "Loading package archives")
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(package-refresh-contents t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; packages to load
(use-package dash
  :ensure t)

(use-package magit
  :ensure t)

(use-package git-gutter
  :ensure t)

(use-package kooten-theme)

(message "Done loading packages!")
