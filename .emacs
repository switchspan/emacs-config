;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs '
;;; ---------------------
;;;
;;; This is my own personal ~/.emacs
;;; Hopefully it will work in most situations
;;;
;;; Copyright (c) 2011 Kenneth Taylor
;;;
;;; Author: Kenneth Taylor, <taylor.kenneth@gmail.com> 2011
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; This file is NOT part of GNU Emacs.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

;; Set the emacs window to the upper left
(set-frame-position (selected-frame) 0 0)

;;* Prerequisites

(message "* --[Loading my Emacs init file ]--")

;; uptimes
(setq emacs-load-start-time (current-time))

;; Identify what parts of your `.emacs' take so long. You can do
;; this e.g. by starting emacs with "emacs -q", set up your
;; load-path, and then evaluate
;;
;; (benchmark-run
;;   (require 'package))
;;
;; The first number appearing in the echo area will be the time needed to run
;; that command.
;;
;; Use autoloads, which delay the loading of the complete package until one of
;; the interactive functions is used.
;;
;; If you want to set options which need to be evaluated after a package is
;; loaded, you can use `eval-after-load'.

;; turn on Common Lisp support
(require 'cl)  ; provides useful things like `loop' and `setf'

;; ;; keep my secrets secret (and not in my `.emacs' file)
;; (let ((personal-settings "~/.hide/.emacs-secrets.gpg"))
;;   (when (file-exists-p personal-settings)
;;     (load personal-settings)))

;; allow quick include/exclude of setup parts
(defvar section-environment t)  ; required
(defvar section-loading-libraries t)  ; required
(defvar section-debugging t)
(defvar section-screen t)
(defvar section-basic t)
(defvar section-minibuffer t)
(defvar section-help t)
(defvar section-mark t)
(defvar section-killing t)
(defvar section-yanking t)
(defvar section-rectangles t)
(defvar section-cua-bindings t)
(defvar section-registers t)
(defvar section-display t)
(defvar section-search t)
(defvar section-fixit t)
(defvar section-keyboard-macros t)
(defvar section-files t)
(defvar section-buffers t)
(defvar section-windows t)
(defvar section-frames t)
(defvar section-international t)
(defvar section-major-modes t)
(defvar section-indentation t)
(defvar section-text t)
(defvar section-programs t)
(defvar section-building t)
(defvar section-maintaining t)
(defvar section-abbrevs t)
(defvar section-dired t)
(defvar section-calendar-diary t)
(defvar section-document-view t)
(defvar section-gnus t)
(defvar section-shell t)
(defvar section-emacs-server t)
(defvar section-printing t)
(defvar section-sorting t)
(defvar section-narrowing t)
(defvar section-saving-emacs-sessions t)
(defvar section-hyperlinking t)
(defvar section-amusements t)
(defvar section-pgg t)
(defvar section-customization t)
(defvar section-ms-dos t)
(defvar section-emacs-display t)

;; ** Environment

(when section-environment (message "0 Environment...")
      ;; OS type --- are we running Microsoft Windows?
      (defvar running-ms-windows
        (eq system-type 'windows-nt))
      
      (defvar running-ms-windows
        (string-match "windows" (prin1-to-string system-type)))
      
      (defvar running-gnu-linux
        (string-match "linux" (prin1-to-string system-type)))
      
      ;; Emacs type --- are we running XEmacs (or GNU Emacs)?
      (defvar running-xemacs
        (string-match "XEmacs" emacs-version))
      
      ;; OS type --- are we running GNU Linux?
      (defmacro GNULinux (&rest body)
        (list 'if (string-match "linux" (prin1-to-string system-type))
              (cons 'progn body)))
      
      (defmacro Windows (&rest body)
        (list 'if (string-match "windows" (prin1-to-string system-type))
              (cons 'progn body)))
      
      (defmacro XLaunch (&rest body)
        (list 'if (eq window-system 'x)(cons 'progn body)))
      
      ;; Emacs type --- are we running GNU Emacs?
      (defmacro GNUEmacs (&rest body)
        "Execute any number of forms if running under GNU Emacs."
        (list 'if (string-match "GNU Emacs" (version))
              (cons 'progn body)))
      
      (defmacro GNUEmacs23 (&rest body)
        (list 'if (string-match "GNU Emacs 23" (version))
              (cons 'progn body)))
      
      (defmacro GNUEmacs22 (&rest body)
        (list 'if (string-match "GNU Emacs 22" (version))
              (cons 'progn body)))
      
      (defmacro XEmacs (&rest body)
        "Execute any number of forms if running under XEmacs."
        (list 'if (string-match "XEmacs" (version))
              (cons 'progn body)))
      
      ;; Emacs version
      (GNUEmacs
       (list emacs-version emacs-major-version emacs-minor-version
             system-type system-name system-configuration
             window-system
             (when (boundp 'aquamacs-version) aquamacs-version)))
      
      (XEmacs
       ;; don't offer migration of the init file
       (setq load-home-init-file t))
      
      (when running-gnu-linux
        (modify-all-frames-parameters
         '((height . 32))))
      
      (message "0 Environment... Done"))

;;; Test of Emacs derivates
;;; -----------------------
(if (string-match "XEmacs\\|Lucid" emacs-version)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; XEmacs
  ;;; ------
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (progn
      (if (file-readable-p "~/.xemacs/init.el")
          (load "~/.xemacs/init.el" nil t))
      )
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; GNU-Emacs
  ;;; ---------
  ;;; load ~/.gnu-emacs or, if not exists /etc/skel/.gnu-emacs
  ;;; For a description and the settings see /etc/skel/.gnu-emacs
  ;;;   ... for your private ~/.gnu-emacs your are on your one.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (if (file-readable-p "~/.gnu-emacs")
      (load "~/.gnu-emacs" nil t)
    (if (file-readable-p "/etc/skel/.gnu-emacs")
        (load "/etc/skel/.gnu-emacs" nil t)))
  
  ;; Custom Settings
  ;; ===============
  ;; To avoid any trouble with the customization system of GNU emacs
  ;; we set the default file ~/.gnu-emacs-custom
  (setq custom-file "~/.gnu-emacs-custom")
  (load "~/.gnu-emacs-custom" t t)
  
;;;
  )

;;; set the default font
(set-default-font "Inconsolata-16")
;;; set a key to cut on line numbers
(autoload 'linum-mode "linum" "toggle line numbers on/off" t) 
(global-set-key (kbd "C-<f5>") 'linum-mode) 

;;; add a hook to cut on line numbers for the selected modes
(add-hook 'visual-basic-mode-hook (lambda() (linum-mode 1)))
(add-hook 'visual-basic-mode-hook (lambda() (setq tab-width 4)))
;;;(add-hook 'vbnet-mode-hook (lambda() (linum-mode 1)))
;;;(add-hook 'html-helper-mode (lambda() (linum-mode 1)))

;;; cut on line numbers for all modes
;;;(global-linum-mode 1)

;;; set the startup window size
(set-frame-height (selected-frame) 50)
(set-frame-width (selected-frame) 120)

;;; set the tab indentation
;;(setq c-basic-offset 2)
;;; set tab to be interpreted as x spaces
;;(setq tab-width 4)

;;; set the default tabs to 4 spaces
;;(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
;;(setq indent-line-function 'insert-tab)


;;; set the standard indent to 2 rather than 4 spaces
;;(setq standard-indent 2)

;;; Add a load path for custom elisp files
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;;; add a mode for zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;;(add-hook 'html-mode-hook (lambda () (zencoding-mode 1))) ;;auto enable zen coding when an html file is opened
(global-set-key (kbd "C-S-e") 'zencoding-expand-line)

;;; add in support for color themes
(add-to-list 'load-path "/.emacs.d/site-lisp/themes/color-theme-library.el")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-cobalt)))

;;; Load nXhtml
(load "~/.emacs.d/plugins/nxhtml/autostart.el")

;; (autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
;; (setq auto-mode-alist (append '(("\\.\\(aspx\\|inc\\|frm\\|bas\\|cls\\|vb\\)$" .
;; 				 vbnet-mode)) auto-mode-alist))

;;; add the HtmlHelperMode
;;;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;;;(setq auto-mode-alist (cons '("\\.aspx$" . html-helper-mode) auto-mode-alist))
;;;(setq auto-mode-alist (cons '("\\.inc$" . html-helper-mode) auto-mode-alist))
;;;(setq auto-mode-alist (cons '("\\.asp$" . html-helper-mode) auto-mode-alist))
;;;(setq auto-mode-alist (cons '("\\.phtml$" . html-helper-mode) auto-mode-alist))

;;; add a mode for snippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/snippets")

;;; cut off mumamo background colors -- they mess with the theme...
(setq mumamo-background-colors nil)

;;; cut on auto-indent with cut and paste
(setq auto-indent-on-visit-file t) ;; If you want auto-indent on for files
(require 'auto-indent-mode)

;;; leave auto-indent on all the time
(auto-indent-global-mode)

;;; load the emacs code browser (ecb)
(add-to-list 'load-path "~/.emacs.d/plugins/ecb")
(require 'ecb)

;;; cut on the find-file-at-point bindings (ffap)
(ffap-bindings)

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

;; use whichever javavscript mode you prefer
(add-hook 'javascript-mode-hook 'my-javascript-mode-fn)
;;(add-hook 'espresso-mode-hook 'my-javascript-mode-fn)

;; load emacs-nav
(message "Loading emacs-nav...")
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-nav/")
(require 'nav)

;; load package.el
(require 'package-maint)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))

;; set up emacs to save files out in the windows temp dir (probably should move this up to one of the os specific configs)
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(message "Emacs start time: %d seconds."
         (time-to-seconds (time-since emacs-load-start-time)))
(sit-for 1.5)

;; load speedbar hooks
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)


(message "-= End of the Emacs init =-")