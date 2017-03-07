;; Load packages

(defvar switchspan/packages '(ac-slime
                          auto-complete
                          autopair
                          clojure-mode
                          coffee-mode
                          csharp-mode
                          deft
                          erlang
                          feature-mode
                          flycheck
                          gist
                          go-autocomplete
                          go-eldoc
                          go-mode
                          graphviz-dot-mode
                          haml-mode
                          haskell-mode
                          htmlize
                          idris-mode
                          magit
                          markdown-mode
                          marmalade
                          o-blog
                          org
                          paredit
                          php-mode
                          puppet-mode
                          restclient
                          rvm
                          scala-mode
                          smex
                          sml-mode
                          solarized-theme
                          web-mode
                          writegood-mode
                          yaml-mode)
  "Default packages")

;; Install default packages
(defun switchspan/packages-installed-p ()
  (loop for pkg in switchspan/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (switchspan/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg switchspan/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))