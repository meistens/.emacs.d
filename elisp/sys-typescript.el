;;; sys-typescript.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; TypeScript/JavaScript configuration setup.
;;; code:

;; tide
;; (use-package tide
;;   :ensure t
;;   :after (typescript-mode company flycheck)
;;   :hook ((typescript-mode . tide-setup)
;; 	 (typescript-mode . tide-hl-identifier-mode)
;; 	 (before-save . tide-format-before-save))
;;   :custom
;;   (tide-completion-ignore-case t)
;;   (tide-always-show-documentation t)
;;   (tide-server-max-response-length 4096)
;;   (tide-completion-detailed t)
;;   (tide-dynamic-completion-delay 0.2)
;;   :config
;;   (flycheck-add-next-checker 'javascript-eslint 'typescript-tslint))

;; typescript mode
(use-package typescript-mode
  :after tree-sitter
  :hook ((typescript-mode . tree-sitter-hl-mode))
  :config
  (setq typescript-indent-level 2))

(provide 'sys-typescript)
;;; sys-typescript.el ends here
