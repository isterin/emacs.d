(require 'textmate)
(textmate-mode)

;; Add speedbar extensions
(speedbar-add-supported-extension ".clj")
(speedbar-add-supported-extension ".scala")
(speedbar-add-supported-extension ".rb")
(speedbar-add-supported-extension ".yml")

(defun clear-shell ()
   (interactive)
   (let ((comint-buffer-maximum-size 0))
     (comint-truncate-buffer)))
	 
(global-set-key (kbd "C-l") 'clear-shell)


;; Eshell
(defun eshell/clear ()
  "Clears the shell buffer ala Unix's clear or DOS' cls"
  (interactive)
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
	;; simply delete the region
	(delete-region (point-min) (point-max))))
	

(setq eshell-directory-name "~/.emacs.d/.eshell/")
(setq eshell-last-dir-ring-file-name
	(concat eshell-directory-name "lastdir"))
(setq eshell-history-file-name
	(concat eshell-directory-name "history"))
  

(defun m-eshell-hook () 
  (define-key eshell-mode-map [(control l)] 'eshell/clear)
)
 
(add-hook 'eshell-mode-hook 'm-eshell-hook)