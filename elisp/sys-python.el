;;; sys-python.el --- -*- lexical-binding: t -*-
;;; commentary:
;;; code:

;; elpy
(use-package elpy
  :ensure t
  :defer t
  :init
;;  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  (advice-add 'python-mode :before 'elpy-enable)
  (setq elpy-shell-echo-output nil)
  (setq elpy-rpc-python-command "python")
  (setq elpy-rpc-timeout 2)
  (setq elpy-rpc-backend "jedi"))

;; python mode
;; (use-package python
;;   :mode ("\\.py" . python-mode)
;;   :config
;;   (setq python-indent-offset 4)
;;   (elpy-enable))

;; Elpy is creating the RPC virtualenv (’/home/meistens/.emacs.d/elpy/rpc-venv’)
;; Automatically install the RPC dependencies from PyPI (needed for completion,
;; autoformatting and documentation) ?
;; install patch if patch not found command
;; back and forth, only 3.11.1 works... 3.5.2 won't work with openssl-devel
;; 3.11.1 no compilation error with tk-devel installed
;; pyenv virtualenv 3.5.2 my-project-virtualenv-name make sure virtualenv is
;; installed
;; update: not gonna bother setting up virtualenv right now

;; pyenv-mode
(use-package pyenv-mode
  :init
  (add-to-list 'exec-path "~/.pyenv/shims")
  (setenv "WORKON_HOME" "~/.pyenv/versions/")
  :config
  (pyenv-mode)
  :bind
  ("C-x p e" . pyenv-activate-current-project))

;; activate virtualenv if one exists automatically

(defun pyenv-activate-current-project ()
  "Automatically activates pyenv version if .python-version file exists."
  (interactive)
  (f-traverse-upwards
   (lambda (path)
     (message path)
     (let ((pyenv-version-path (f-expand ".python-version" path)))
       (if (f-exists? pyenv-version-path)
            (let ((pyenv-current-version (s-trim (f-read-text pyenv-version-path 'utf-8))))
              (pyenv-mode-set pyenv-current-version)
              (message (concat "Setting virtualenv to " pyenv-current-version))))))))

;; activate global version of python to the global one
(defvar pyenv-current-version nil nil)

(defun pyenv-init()
  "Initialize pyenv's current version to the global one."
  (let ((global-pyenv (replace-regexp-in-string "\n" "" (shell-command-to-string "pyenv global"))))
    (message (concat "Setting pyenv version to " global-pyenv))
    (pyenv-mode-set global-pyenv)
    (setq pyenv-current-version global-pyenv)))

(add-hook 'after-init-hook 'pyenv-init)

(provide 'sys-python)
;;; sys-python.el ends here
