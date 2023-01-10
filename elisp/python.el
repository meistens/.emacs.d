;;; python.el --- -*- lexical-binding: t --- -*-
;;; commentary:
;;; code:

;; elpy
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
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
;; (y or n) y
(provide 'python)
;;; python.el ends here
