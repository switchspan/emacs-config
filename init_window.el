;; Set the emacs window to the upper left
;;(set-frame-position (selected-frame) 5 5)

;; initial window
(setq initial-frame-alist
      '(
        (width . 102) ; character
        (height . 54) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 100) ; character
        (height . 52) ; lines
        ))

(setq default-frame-alist
      '((background-color . "cornsilk")))

;; Set the default window size
;(defun set-frame-size-according-to-resolution ()
;  (interactive)
;  (if window-system
;  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
;    (if (> (x-display-pixel-width) 1280)
;           (add-to-list 'default-frame-alist (cons 'width 120))
;           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
;    (add-to-list 'default-frame-alist 
;         (cons 'height (/ (- (x-display-pixel-height) 500)
;                             (frame-char-height)))))))

;(set-frame-size-according-to-resolution)
