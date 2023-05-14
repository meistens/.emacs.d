;;; sys-globals.el --- -*- lexical-binding: t -*-
;;; commentary:
;; some misc stuff, should be in sys-configs, ah well...
;;; code:

;; Basic info
;; (setq user-full-name "David Mebo")
;; (setq user-mail-address "mebodave@gmail.com")

;; ivy, amx, counsel, swiper
;; (use-package ivy
  ;; :diminish
  ;; :init
  ;; (use-package amx :defer t)
  ;; (use-package counsel :diminish :config (counsel-mode 1))
  ;; (use-package swiper :defer t)
  ;; (ivy-mode 1)
  ;; :bind
  ;; (("C-s" . swiper-isearch)
  ;;  (:map ivy-minibuffer-map
  ;;        ("M-RET" . ivy-immediate-done))
  ;;  (:map counsel-find-file-map
  ;;        ("C-~" . counsel-goto-local-home)))
  ;; :custom
  ;; (ivy-use-virtual-buffers t)
  ;; (ivy-height 10)
  ;; (ivy-on-del-error-function nil)
  ;; (ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-create)
  ;; (ivy-count-format "【%d/%d】")
  ;; (ivy-wrap t)
  ;; :config
  ;; (defun counsel-goto-local-home ()
  ;;   "Go to the $HOME of the local machine."
  ;;   (interactive)
  ;;   (ivy--cd "~/")))
;; vertico
(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-resize t))

;; persist vertico history, goes with vertico
(use-package savehist
  :init
  (savehist-mode))

;; more vertico configs
(use-package emacs
  :init
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
		  (replace-regexp-in-string
		   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
		   crm-separator)
		  (car args))
	 (cdr args)))
(advice-add #'completing-read-multiple :filter-args #'crm-indicator)

;; do not allow cursor in the minibuffer
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; enable recursive minibuffers
(setq enable-recursive-minibuffers t))


;; color rg, make sure ripgrep is installed in PATH
(use-package color-rg
  :load-path (lambda () (expand-file-name "site-elisp/color-rg" user-emacs-directory))
  :if (executable-find "rg")
  :bind ("C-M-s" . color-rg-search-input))

;; disk usage
(use-package disk-usage
  :commands (disk-usage))

;; which key
(use-package which-key
  :diminish
  :custom
  (which-key-separator " ")
  (which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; popup kill ring
(use-package popup-kill-ring
  :bind ("M-y" . popup-kill-ring))

;; undo tree
(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-visualizer-diff t)
  (undo-tree-history-directory-alist `(("." . ,(expand-file-name ".backup" user-emacs-directory))))
  (undo-tree-visualizer-timestamps t))

;; trash backup files
(setq backup-directory-alist
      '((".*" . "~/.Trash")))
;; tramp
(setq tramp-backup-directory-alist backup-directory-alist)

;; any vc files
(setq vc-make-backup-files t)

;; tree-sitter global configs

;; tree-sitter langs
(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)

;; tree-sitter
(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(provide 'sys-globals)
;;; sys-globals.el ends here
