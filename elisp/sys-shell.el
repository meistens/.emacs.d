;;; sys-shell.el --- -*- lexical-binding: t -*-
;;; commentary:
;; shell configs here
;;; code:

;; set up the correct path just in case some packages does not detect the
;; correct path automatically
(setenv "PATH"
        (concat
         "/usr/local/bin:/usr/local/sbin:"
         (getenv "PATH")))

;; TODO: Tramp setup here

;; ShellCheck
;; Checks for errors in scripts.
(flycheck-define-checker shellcheck
  "Shell script syntax checker"
  :command ("shellcheck" source)
  :error-patterns
  ((warning line-start
	    (file-name) ":" line ":" (optional column ":") " warning: " (message)
	    line-end)
   (error line-start
	  (file-name) ":" line ":" (optional column ":") " error: " (message)
	  line-end))
  :modes sh-mode)

(add-to-list 'flycheck-checkers 'shellcheck)
(add-hook 'sh-mode-hook (lambda () (flycheck-mode 1)))

;; Shebang additions to the top of a file based on the language detected.
;; Searches based on the env becasue who knows where your script might end up at
(defun dm/shebang-and-rev-buffer ()
  "Add a shebang at the top of the file and reverts buffer."
  (interactive)
  (goto-char (point-min))
  (let ((shebang (cond ((equal major-mode 'sh-mode) "#!/usr/bin/env bash\n")
		      ((equal major-mode 'python-mode) "#!/usr/bin/env python3\n")
		       (t nil))))
       (when shebang
	 (insert shebang)
	 (save-buffer t))
       (revert-buffer t t)))

(provide 'sys-shell)
;;; sys-shell.el ends here
