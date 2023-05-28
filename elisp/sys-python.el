;;; sys-python.el --- -*- lexical-binding: t -*-
;;; commentary:
;; Mostly Python stuff outside of eglot like venvs and other stuff
;;; code:

;; Virtual env setup
;; Apparently, this does not work per-se if a venv is opened in the terminal
;; so best option is to open Emacs via terminal inside the directory where the
;; .envrc is open.
;; Till then, probably look elsewhere for a proper Virtual environment setup
;; that works or be (don't) like me and have a script that does everything.

(use-package direnv
  :config
  (direnv-mode 1))

(use-package pyvenv
  :init
  (setenv "WORKON_HOME" (substitute-in-file-name "${WORKON_HOME}"))
  :config
  (pyvenv-mode 1))

(provide 'sys-python)
;;; sys-python.el ends here
