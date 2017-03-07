;; keybindings

(global-set-key (kbd "C-x g") 'magit-status)
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)
