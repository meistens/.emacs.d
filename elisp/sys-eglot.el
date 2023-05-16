;;; sys-eglot.el --- -*- lexical-binding: t -*-
;;; commentary:
;; server for C, Js, Py and Ts.  To add more, swap out/use existing setup to
;; configure yours
;;; code:

;; eglot
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(python-mode . ("jedi-language-server")))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'js-mode-hook 'eglot-ensure)
  (add-hook 'typescript-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure))

;; Detect Venv automatically, not gonna go through the trouble of doing
;; a separate setup...
(defun eglot-detect-virtualenv ()
  "Detects if a virtaul environment (venv) is activated for Python."
  (let* ((venv-dir-name "env")
	 (venv-bin-dir (locate-dominating-file default-directory venv-dir-name)))
    (when venv-bin-dir
      (let* ((python-executable (concat venv-bin-dir "bin/python"))
	     (venv-name (file-name-base (directory-file-name venv-bin-dir))))
	(setq-local eglot-python-command python-executable)
	(message "Virtual environment activated: %s" venv-name)))))

(add-hook 'python-mode-hook 'eglot-detect-virtualenv)

(provide 'sys-eglot)
;;; sys-eglot.el ends here
