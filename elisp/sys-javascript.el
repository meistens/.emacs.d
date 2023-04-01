;;; sys-javascript.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; JavaScript configuration file.  Separated them because while TypeScript works
;; with JavaScript, rather they be separated.
;;; code:

;; js2-mode
(use-package js2-mode
  :mode "\\.js\\'"
  :interpreter "node"
  :config
  (setq js-indent-level 2
	js2-basic-offset 2)
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(defun dm/semistandard-fix ()
  "Use semistandard --fix to fix current file."
  (interactive)
  (when (and (executable-find "semistandard")
	     buffer-file-name)
    (message "semistandard is working its magic on %s" buffer-file-name)
    (call-process "semistandard" nil nil nil "--fix" buffer-file-name)
    (revert-buffer t t t)))

;; run semistandard --fix before saving buffer
(add-hook 'js2-mode-hook
	  (lambda ()
	    (add-hook 'after-save-hook #'dm/semistandard-fix nil t)))

(provide 'sys-javascript)
;;; sys-javascript.el ends here
