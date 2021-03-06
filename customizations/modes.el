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
(setq ensime-default-server-cmd "~/.emacs.d/vendor/ensime/server")


;; Lisp

;; Defer slime, this is to play nice with clojure-jack-in
(defun slime ()
  (interactive)
	(fmakunbound 'slime)
	(load (expand-file-name "~/quicklisp/slime-helper.el"))
	(set-language-environment "UTF-8")
	(setq inferior-lisp-program "/usr/local/bin/sbcl"
		lisp-indent-function 'common-lisp-indent-function
		slime-complete-symbol-function 'slime-fuzzy-complete-symbol
		slime-net-coding-system 'utf-8-unix)
	(slime)
	(slime-setup '(slime-fancy slime-contrib)))

; (setq inferior-lisp-program "/usr/local/bin/sbcl"
  ;; Change me!
  ; slime-path (expand-file-name "~/.emacs.d/vendor/slime/")
  ; w3m-command "/usr/local/bin/w3m"
  ; cltl2-url "file:///usr/share/doc/cltl/clm/node1.html"
  ; hyperspec-prog (concat slime-path "hyperspec")
  ; hyperspec-path "/usr/share/doc/hyperspec/"
  ; lisp-indent-function 'common-lisp-indent-function
  ; slime-complete-symbol-function 'slime-fuzzy-complete-symbol
  ; common-lisp-hyperspec-root (concat "file://" hyperspec-path)
  ; common-lisp-hyperspec-symbol-table (concat hyperspec-path "Data/Map_Sym.txt")
  ; w3m-default-homepage "file:///usr/share/doc/hyperspec/Front/X_Symbol.htm"
  ; browse-url-browser-function '(("." . w3m-browse-url-other-window))
  ; w3m-symbol 'w3m-default-symbol
  ; w3m-key-binding 'info
  ; w3m-coding-system 'utf-8
  ; w3m-default-coding-system 'utf-8
  ; w3m-file-coding-system 'utf-8
  ; w3m-file-name-coding-system 'utf-8
  ; w3m-terminal-coding-system 'utf-8
  ; )


(eval-after-load 'slime
  '(progn
    ; (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
    (add-to-list 'slime-lisp-implementations 
      '(sbcl ("/usr/local/bin/sbcl")))))
	  
	  

;; Scheme (Geiser)
(setq geiser-racket-binary "/Users/ilya/Applications/Racket v5.3/bin/racket")

;; R-mode
(global-set-key (kbd "s-r") (lambda ()
  (interactive)
	(R)
	(ess-eval-linewise "options(device='quartz')"
			   nil nil nil 'wait-prompt)))
			   
;; Python
(add-hook 'python-mode-hook
  (lambda ()
	(set-variable 'py-indent-offset 4)
	;(set-variable 'py-smart-indentation nil)
	(set-variable 'indent-tabs-mode nil)
	(define-key py-mode-map (kbd "RET") 'newline-and-indent)
	;(define-key py-mode-map [tab] 'yas/expand)
	;(setq yas/after-exit-snippet-hook 'indent-according-to-mode)
	))			   
