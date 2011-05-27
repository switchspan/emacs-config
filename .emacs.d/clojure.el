;; Loads the file mode and other plugins needed for Clojure programming

(message "Loading Clojure settings...")
;;(require 'clojure-mode)

;; load support for leiningen commands
(add-to-list 'load-path "~/.emacs.d/elpa/elein-0.1")
(require 'elein)
