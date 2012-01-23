(defun getmyenv (name)
  (if (not (getenv name))
  	(setenv name
      (shell-command-to-string (concat "source $HOME/.bash_profile && printf $" name))))
  (getenv name))