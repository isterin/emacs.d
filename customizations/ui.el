(message "Loading ui.el")
;; Revive
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)

(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 140))
(set-face-attribute 'default nil :height 180) ; 1/10th, so 160 is 16 point font

;; Solarized theme	
(require 'solarized-dark-theme)
; (require 'solarized-light-theme)
(global-set-key (kbd "C-S-s-d") (lambda () (interactive) (color-theme-solarized-dark)))
(global-set-key (kbd "C-S-s-l") (lambda () (interactive) (color-theme-solarized-light)))


;; I like splitting buffers vertically by default
; (setq split-height-threshold nil)
; (setq split-width-threshold 0)


;; Moving windows...
(global-set-key (kbd "S-s-<left>") 'windmove-left)          ; move to left windnow
(global-set-key (kbd "S-s-<right>") 'windmove-right)        ; move to right window
(global-set-key (kbd "S-s-<up>") 'windmove-up)              ; move to upper window
(global-set-key (kbd "S-s-<down>") 'windmove-down)

(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-{") 'previous-buffer)


(global-set-key (kbd "s-1") (lambda ()
	(interactive)
	(sr-speedbar-toggle)
	(sr-speedbar-select-window)))
(setq sr-speedbar-width 30
	sr-speedbar-width-x 30)