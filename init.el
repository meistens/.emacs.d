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
(require 'sys-configs)

;; programming tools
(require 'sys-progs)

;; typescript only
;; (require 'sys-typescript)

;; python only
(require 'sys-python)

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
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(package-selected-packages
   '(tree-sitter-langs tide typescript-mode skewer-mode css emmet-mode web-mode org-appear org-superstar pyenv-mode elpy company-box company evil-nerd-commenter format-all highlight-indent-guides smartparens flycheck-popup-tip flycheck-posframe flycheck yasnippet-snippets yasnippet projectile undo-tree popup-kill-ring which-key disk-usage counsel amx ivy eglot ace-window command-log-mode doom-modeline all-the-icons doom-themes diminish auto-package-update use-package))
 '(warning-suppress-types '((comp) (comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
