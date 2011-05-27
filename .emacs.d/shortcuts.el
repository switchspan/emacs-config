;; Loads Emacs global shortcuts and keybindings
;; M = Meta key (alt)
;; C = Ctrl key (ctrl)
;; S = Shift key (shift)
;; s = Super key (windows key)

(message "Loading shortcuts...")

;; set a key to cut on line numbers
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)

;;; cut on line numbers for all modes
;;(global-linum-mode 1)

;; set a key for activating ecb
(global-set-key (kbd "C-<f1>") 'ecb-activate)
(global-set-key (kbd "C-<f2>") 'ecb-deactivate)

;; set a key for toggling truncate lines for the editor
(global-set-key (kbd "C-S-l") 'toggle-truncate-lines)

;; set a key for showing file whitespace
(global-set-key (kbd "s-w") 'whitespace-mode) 

;; set a key for emacs-nav
(global-set-key (kbd "s-n") 'nav)

;; set a key for speed bar.
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)

;; define a function to copy a line into the kill ring
(defun line-copy (numlines)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
		  (line-beginning-position (+ 1 numlines)))
  (message "%d line%s copied" numlines (if (= 1 numlines) "" "s")))

;;(global-set-key (kbd "s-y") 'line-copy)