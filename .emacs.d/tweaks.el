;; Contains several Emacs tweaks that don't need their own config file

(message "Loading tweaks.el...")

;; turn on Common Lisp support
(require 'cl) ; provides useful things like 'loop' and 'setf'

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

(when section-environment (message "0 Environment...")
      ;; OS type --- are we running Microsoft Windows?
      (defvar running-ms-windows
        (eq system-type 'windows-nt))
      
      (defvar running-ms-windows
        (string-match "windows" (prin1-to-string system-type)))
      
      (defvar running-mac-osx
	(eq system-type 'darwin))

      (defvar runnin-mac-osx
	(string-match "darwin" (prin1-to-string system-type)))

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
  ;; we set the default file ~/.emacs.d/.gnu-emacs-custom
  (setq custom-file "~/.emacs.d/.gnu-emacs-custom")
  (load "~/.emacs.d/.gnu-emacs-custom" t t)
  
;;;
  )

;;; set the tab indentation
;;(setq c-basic-offset 2)
;;; set tab to be interpreted as x spaces
(setq tab-width 4)

;;; set the default tabs to 4 spaces
;;(setq-default indent-tabs-mode nil)
(setq-default indent-tabs-mode 1)
(setq-default tab-width 4)
;;(setq indent-line-function 'insert-tab)

;;; set the standard indent to 2 rather than 4 spaces
(setq standard-indent 4)

;;; cut on auto-indent with cut and paste
;;(setq auto-indent-on-visit-file t) ;; If you want auto-indent on for files

;;(require 'auto-indent-mode)
;;; leave auto-indent on all the time
;;(auto-indent-global-mode)

;; set up emacs to save files out in the windows temp dir (probably should move this up to one of the os specific configs)
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups



;;; add a hook to cut on line numbers for the selected modes
(add-hook 'visual-basic-mode-hook (lambda() (linum-mode 1)))
(add-hook 'visual-basic-mode-hook (lambda() (setq tab-width 4)))
;;;(add-hook 'vbnet-mode-hook (lambda() (linum-mode 1)))
;;;(add-hook 'html-helper-mode (lambda() (linum-mode 1)))

;;; cut on the find-file-at-point bindings (ffap)
(ffap-bindings)

;; set yes-or-no-p to y-or-n-p to save some keystrokes
(defalias 'yes-or-no-p 'y-or-n-p)

;; use ido-mode for smarter file finding and buffer switching
(require 'ido)

;; load speedbar for another quick browsing option
(require 'sr-speedbar)
(custom-set-variables
 '(speedbar-show-unknown-files t))

;; cut off the splash screen for emacs
(setq inhibit-splash-screen t)

;; turn on AutoFillMode for text mode buffers
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; frame title bar formatting to show full path of the file
(setq-default
 frame-title-format
 (list '((buffer-file-name "%f" (dired-directory
				 dired-directory
				 (revert-buffer-function "%b"
							 ("%b - Dir: " default-directory)))))))

;; set the default start up directory
(when running-ms-windows
  (setq default-directory "C:/"))

;; load the textmate minor mode
;;(add-to-list 'load-path "~/.emacs.d/elpa/textmate-1/textmate.el")
;;(require 'textmate)
;;(textmate-mode)

;; cut off the ECB tip of the day
(setq ecb-tip-of-the-day nil)

;; cut on CUA mode for windows cut and past characters (i.e C-c,C-x,C-v)
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour