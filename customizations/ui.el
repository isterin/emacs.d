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

