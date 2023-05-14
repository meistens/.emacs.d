;;; sys-javascript.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; JavaScript configuration file.
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

;; append semistandard logo to README
(defun dm/append-semistandard-logo ()
  "Append semistandard logo to README file, else create README with the logo."
  (interactive)
  (let* ((logo "[![js-semistandard-style](https://img.shields.io/badge/code%20style-semistandard-brightgreen.svg)](https://github.com/standard/semistandard)")
	(readme-file "README.md")
	(header-regexp "^#.*$"))
  (if (file-exists-p readme-file)
      (with-current-buffer (find-file-noselect readme-file)
	(goto-char (point-min))
	(if (re-search-forward header-regexp nil t)
	    (progn
	      (beginning-of-line)
	      (insert "\n" logo "\n"))
	  (progn
	    (goto-char (point-max))
	  (insert "\n" logo "\n"))))
  (with-temp-file readme-file
    (insert logo "\n")))))

(provide 'sys-javascript)
;;; sys-javascript.el ends here
