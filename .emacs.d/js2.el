;; Loads the javascript mode for emacs

(message "Loading javascript settings...")

;; use whichever javavscript mode you prefer
(add-hook 'javascript-mode-hook 'my-javascript-mode-fn)
;;(add-hook 'espresso-mode-hook 'my-javascript-mode-fn)