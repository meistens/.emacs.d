;;; ui.el --- -*- lexical-binding: t -*-
;;; commentary:
;; UI enhancements
;;; code:

;; doom-theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold nil    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; all-the-icons
(use-package all-the-icons
  :if (display-graphic-p))

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 20)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 4)

;; Whether display icons in the mode-line.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon t)

;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display the colorful icon for `major-mode'.
;; It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; What to display as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; Don’t compact font caches during GC.
(setq inhibit-compacting-font-caches t)

;; dashboaard
;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (dashboard-setup-startup-hook))

;; ;; daemon dashboard
;; (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; ;; rest of the configs
;; ;; Set the title
;; (setq dashboard-banner-logo-title "Back to cry or do some actual work?")
;; ;; Set the banner
;; (setq dashboard-startup-banner 3)
;; ;; Value can be
;; ;; - nil to display no banner
;; ;; - 'official which displays the official emacs logo
;; ;; - 'logo which displays an alternative emacs logo
;; ;; - 1, 2 or 3 which displays one of the text banners
;; ;; - "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer
;; ;; - a cons of '("path/to/your/image.png" . "path/to/your/text.txt")

;; ;; Content is not centered by default. To center, set
;; (setq dashboard-center-content t)

;; ;; To disable shortcut "jump" indicators for each section, set
;; (setq dashboard-show-shortcuts nil)

;; (setq dashboard-items '((recents  . 5)
;;                         (projects . 5)))

;; (setq dashboard-set-init-info t)

;; ;; (setq dashboard-init-info "meistens??")

;; (setq dashboard-set-footer nil)

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

;; yes/no
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

;; line numbers
;; Hook line numbers to only when files are opened, also use linum-mode for emacs-version< 26
(if (version< emacs-version "26")
    (global-linum-mode)
  (add-hook 'text-mode-hook #'display-line-numbers-mode)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode))

;; Display column numbers in modeline
(column-number-mode 1)

(setq inhibit-startup-screen t)
(setq initial-major-mode 'text-mode)
;; https://www.youtube.com/watch?v=NfjsLmya1PI
(setq initial-scratch-message "Back to work or cry meistens?\n")

(provide 'ui)
;;; ui.el ends here
