;;; python.el --- -*- lexical-binding: t --- -*-
;;; commentary:
;;; code:

;; elpy
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  (setq elpy-shell-echo-output nil)
  (setq elpy-rpc-python-command "python")
  (setq elpy-rpc-timeout 2)
  (setq elpy-rpc-backend "jedi"))

;; python mode
(use-package python
  :mode ("\\.py" . python-mode)
  :config
  (setq python-indent-offset 4)
  (elpy-enable))

;; Elpy is creating the RPC virtualenv (’/home/meistens/.emacs.d/elpy/rpc-venv’)
;; Automatically install the RPC dependencies from PyPI (needed for completion,
;; autoformatting and documentation) ?
;; install patch if patch not found command
;; back and forth, only 3.11.1 works... 3.5.2 won't work with openssl-devel
;; 3.11.1 no compilation error with tk-devel installed
;; pyenv virtualenv 3.5.2 my-project-virtualenv-name make sure virtualenv is
;; installed
;; update: not gonna bother setting up virtualenv right now

;; (y or n) y
(provide 'python)
;;; python.el ends here
