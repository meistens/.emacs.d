;;; init.el --- -*- lexical-binding: t -*-
;;; commentary:
;; This file contains imports of different packages and settings found in the
;; elisp/ folder.  Makes it easy to troubleshoot and configure without putting
;; all setup in one file.
;;; code:

;; early init
(require 'early-init)
;; package manager
(require 'package-manager)
;; UI
(require 'sys-UI)
;; eglot
(require 'sys-eglot)
;; global functionalities
(require 'sys-globals)
;; some configs
(require 'sys-settings)
;; org
(require 'sys-org)
;; HTML, CSS, liveserver
(require 'sys-web)
;; TypeScript
(require 'sys-typescript)
;; JavaScript
(require 'sys-javascript)
;; Shell (lisp shell, and related shell functions)
(require 'sys-shell)
;; keybinds
(load "sys-keybinds")
;; Python
(require 'sys-python)
;; Custom stuff
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
