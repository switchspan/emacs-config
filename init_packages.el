;; load the needed packages
;; this was adopted from emacs-starter-kit (https://github.com/technomancy/emacs-starter-kit)
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(defvar my-packages '(better-defaults paredit idle-highlight-mode ido-ubiquitous
                                      find-file-in-project magit smex scpaste dash 
                                      git-gutter kooten-theme))

(package-initialize)
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
