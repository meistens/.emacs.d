;;; sys-settings.el --- -*- lexical-binding: t -*-
;;; commentary:
;; Settings
;;; code:

;; UTF-8
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; history
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-auto-cleanup "05:00am")
  (recentf-max-saved-items 200)
  (recentf-exclude '((expand-file-name package-user-dir)
                     ".cache"
                     "cache"
                     "recentf"
                     "undo-tree-hist"
                     "url")))

;; When buffer is closed, saves the cursor location
(save-place-mode 1)

;; Set history-length longer
(setq-default history-length 500)

;; Automatically kill all active processes when closing Emacs
(setq confirm-kill-processes nil)

;; Turn Off Cursor Alarms
(setq ring-bell-function 'ignore)

;; Show Keystrokes in Progress Instantly
(setq echo-keystrokes 0.1)

;; Don't Lock Files
(setq-default create-lockfiles nil)

;; kill compilation process before starting another
(setq-default compilation-always-kill t)

;; save all buffers on `compile'
(setq-default compilation-ask-about-save nil)

;; scroll while compiling
(setq-default compilation-scroll-output t)

;; Add a newline automatically at the end of the file upon save.
(setq require-final-newline t)

;; scroll setup
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(1 ((shift) . 1))
      fast-but-imprecise-scrolling nil
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-margin 1
      scroll-step 1
      hscroll-margin 1
      hscroll-step 1)

;; highlight line mode
(global-hl-line-mode 1)

;; yes/no? more like y/n
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

;; hide mouse when typing
(setq make-pointer-invisible t)

(provide 'sys-settings)
;;; sys-settings.el ends here
