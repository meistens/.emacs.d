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

;; programming tools
;; (require 'sys-progs)

;; org
(require 'sys-org)

;; HTML, CSS, liveserver
(require 'sys-web)

;; TypeScript
(require 'sys-typescript)

;; JavaScript
(require 'sys-javascript)

;; keybinds
(load "sys-keybinds")

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-box company cape yasnippet-snippets which-key web-mode vertico use-package undo-tree typescript-mode smartparens rainbow-mode projectile popup-kill-ring org-superstar org-appear orderless nerd-icons-completion marginalia kind-icon js2-mode impatient-mode highlight-indent-guides format-all flycheck-posframe flycheck-popup-tip evil-nerd-commenter eglot doom-themes doom-modeline disk-usage diminish corfu consult command-log-mode auto-package-update all-the-icons ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
