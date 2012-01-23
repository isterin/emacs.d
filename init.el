(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-ruby)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/utilities")
(add-to-list 'load-path "~/.emacs.d/vendor")


(load-file "~/.emacs.d/load-directory.el")

; load utility functions
(mapcar 'load-directory '("~/.emacs.d/utilities"))

;; Load vendor stuff
(vendor 'revive)
(vendor 'color-theme-solarized)
(add-to-list 'load-path "~/.emacs.d/vendor/scala-mode") ;; This must be done without autorequire
(vendor 'ensime)

; load customizations
(mapcar 'load-directory '("~/.emacs.d/customizations"))
