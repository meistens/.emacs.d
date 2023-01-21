;;; sys-UI.el --- -*- lexical-binding: t -*-
;;; commentary:
;; Emacs UI, gotta look nice though
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

;; line numbers
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; wrap texts
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'prog-mode-hook 'visual-line-mode)

;; Display column numbers in modeline
(column-number-mode 1)

;; Depressing scratch board no more depressing (or is it still?)
;; edit to taste
(setq inhibit-startup-screen t)
(setq initial-major-mode 'text-mode)
(setq initial-scratch-message "Back to work or cry meistens?\n")

;; 1920px without affecting company box, edit the values to suit your screen
(if (window-system) (set-frame-size (selected-frame) 90 35))

;; split frame size
(setq default-frame-alist '((width . 85) (height . 35)))

;; frame transparency
(set-frame-parameter (selected-frame) 'alpha '(80 . 80))
(add-to-list 'default-frame-alist '(alpha . (80 . 80)))

;; displays a panel for commands keyed in
(use-package command-log-mode)

;; fonts setup, change to fit your system
(set-frame-font "Iosevka Term SS18 Bold Italic" nil t)
(set-face-attribute 'default nil
		    :height 140
		    :weight 'bold)

;; mode-line font
(set-face-attribute 'mode-line nil
		    :font "Comfortaa Light"
		    :height 150)

;; frame scaling/zooming
;; (use-package default-text-scale
;;   :defer 1
;;   :config
;;   (default-text-scale-mode))

;; ace-window
(use-package ace-window
  :bind ("M-o" . ace-window))

;; Focus on split window
(defun split-and-follow-horizontally ()
  "Focus on split window."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  "Focus on split window."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;; kill buffer without asking for confirmation
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

;; make ibuffer default
(global-set-key (kbd "C-x b") 'ibuffer)

(provide 'sys-UI)
;;; sys-UI.el ends here
