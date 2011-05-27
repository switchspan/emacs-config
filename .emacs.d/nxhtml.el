;;; Load nXhtml
(load "~/.emacs.d/plugins/nxhtml/autostart.el")

;; (autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
;; (setq auto-mode-alist (append '(("\\.\\(aspx\\|inc\\|frm\\|bas\\|cls\\|vb\\)$" .
;;                               vbnet-mode)) auto-mode-alist))

;;; add the HtmlHelperMode
;;;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;;;(setq auto-mode-alist (cons '("\\.aspx$" . html-helper-mode) auto-mode-alist))
;;;(setq auto-mode-alist (cons '("\\.inc$" . html-helper-mode) auto-mode-alist))
;;;(setq auto-mode-alist (cons '("\\.asp$" . html-helper-mode) auto-mode-alist))
;;;(setq auto-mode-alist (cons '("\\.phtml$" . html-helper-mode) auto-mode-alist))

;;; cut off mumamo background colors -- they mess with the theme...
(setq mumamo-background-colors nil)