;;; ui.el --- -*- lexical-binding: t -*-
;;; commentary:
;;; code:

;; doom-theme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold nil
        doom-themes-enable-italic t)
  (load-theme 'doom-dracula t)
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; all-the-icons
(use-package all-the-icons
  :if (display-graphic-p))
;; run M-x all-the-icons-install-fonts <RET> (same as enter key)

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))
(setq doom-modeline-height 20)
(setq doom-modeline-bar-width 4)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-env-load-string "be patient...")
(setq inhibit-compacting-font-caches t)

;; Vertical Scroll
(setq scroll-step 1)
(setq scroll-margin 1)
(setq scroll-conservatively 101)
(setq scroll-up-aggressively 0.01)
(setq scroll-down-aggressively 0.01)
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)

;; Horizontal Scroll
(setq hscroll-step 1)
(setq hscroll-margin 1)

;; highlight line mode
(global-hl-line-mode 1)

;; yes/no? more like y/n
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

;; line numbers
(if (version< emacs-version "26")
    (global-linum-mode)
  (add-hook 'text-mode-hook #'display-line-numbers-mode)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode))

;; Display column numbers in modeline
(column-number-mode 1)

;; Depressing scratch board no more depressing (or is it still?)
(setq inhibit-startup-screen t)
(setq initial-major-mode 'text-mode)
(setq initial-scratch-message "Back to work or cry meistens?\n")

;; 1920px without affecting company box, edit the values to suit your screen
;; same rule does not apply to frames created (C-x 5 [insert number])
;; guess i'll dig around and put together a function for that
(if (window-system) (set-frame-size (selected-frame) 120 40))

;; displays a panel for commands keyed in
(use-package command-log-mode)

(provide 'ui)
;;; ui.el ends here
