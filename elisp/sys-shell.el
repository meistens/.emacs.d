;;; sys-shell.el --- -*- lexical-binding: t --- -*-
;;; commentary:
;; shell configs
;;; code:

;; use bash as your default shell in ansi-term
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  "Bash shell default  in 'ansi-term'."
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; copy/paste from ansi-term
(defun my-term-mode-hook ()
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-k")
    (lambda ()
      (interactive)
      (term-send-raw-string "\C-k")
      (kill-line))))
(add-hook 'term-mode-hook 'my-term-mode-hook)

;; tramp
(setq tramp-default-method "ssh")
