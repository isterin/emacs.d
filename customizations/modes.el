;; Org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; Scala
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(message "setting ensime....")
;; This is ugly, find a way to use env variables
(getmyenv "ENSIME_HOME") ;; Needed to make the ensime script succeed
(set-variable 'ensime-default-server-cmd "~/.emacs.d/vendor/ensime/server")