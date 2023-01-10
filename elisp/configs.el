;;; configs.el --- -*- lexical-binding: t -*-
;;; commentary:
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

;; Better Compilation
(setq-default compilation-always-kill t) ; kill compilation process before
;; starting another

(setq-default compilation-ask-about-save nil) ; save all buffers on `compile'

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ;; make ESC key quit
;; in place of C-g

(setq-default compilation-scroll-output t)

;; Add a newline automatically at the end of the file upon save.
(setq require-final-newline t)

(provide 'configs)
;;; configs.el ends here
