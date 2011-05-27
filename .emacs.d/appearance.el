;; Loads color themes, fonts, and other Emacs appearance related items

(message "Loading appearance settings...")

;; set the default font
(set-default-font "Inconsolata-16")

;;; set the startup window size
(set-frame-height (selected-frame) 50)
(set-frame-width (selected-frame) 120)

;;; add in support for color themes
(add-to-list 'load-path "/.emacs.d/site-lisp/themes/color-theme-library.el")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-cobalt)))

;;; maximize the screen if we are running on windows
(cond (running-ms-windows
       ;; setting the PC keyboard's various keys to
       ;; Super or Hyper, for emacs running on Windows.
       (setq w32-pass-lwindow-to-system nil 
             w32-pass-rwindow-to-system nil 
             w32-pass-apps-to-system nil 
             w32-lwindow-modifier 'super ; Left Windows key 
             w32-rwindow-modifier 'super ; Right Windows key 
             w32-apps-modifier 'hyper) ; Menu key
       ;; start emacs maximized in windows
       (w32-send-sys-command 61488)
       ;; set shell to windows powershell
       (autoload 'powershell "powershell" "Run powershell as a shell within emacs." t)
       ;; set flymake to use JSLint on javacript
       (require 'flymake-for-jslint-for-wsh "flymake-for-jslint-for-wsh.el")
       (setq flymake-for-jslint-jslint-location "~/.emacs.d/site-lisp/jslint-for-wsh.js")
       
       (defun my-javascript-mode-fn ()
         (flymake-mode 1))))

;; add the whitespace mode
(require 'whitespace)
(autoload 'whitespace-mode           "whitespace" "Toggle whitespace visualization."        t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)