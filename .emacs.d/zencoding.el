;;; add a mode for zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;;(add-hook 'html-mode-hook (lambda () (zencoding-mode 1))) ;;auto enable zen coding when an html file is opened
(global-set-key (kbd "C-S-e") 'zencoding-expand-line)