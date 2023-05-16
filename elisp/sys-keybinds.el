;;; sys-keybinds.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; Keybinds here.  Makes it easier to keep track em
;;; Code:

;; Unbind unneeded keys
(global-set-key (kbd "M-z") nil) ;; zaps a character in a line

(global-set-key (kbd "M-m") nil) ;; back-to-indentation

(global-set-key (kbd "C-x C-z") nil) ;; suspend emacs, like a minimize but isn't really

(global-set-key (kbd "M-/") nil) ;; dabbrev expand

;; Truncate lines (rebound from downcase)
(global-set-key (kbd "C-x C-l") #'toggle-truncate-lines)

;; liveserver start
(global-set-key (kbd "C-c l") 'dm/start-impatient-server)

;; ESC now in place of C-g
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; append semistandard logo to README (DO IT IF YOU HAVE A Js FILE, IT DOESN'T
;; DETECT IT AND APPEND!!!)
(global-set-key (kbd "C-c j s") 'dm/append-semistandard-logo)

;; shebang kbd
(global-set-key (kbd "C-c s") 'dm/shebang-and-rev-buffer)

(provide 'sys-keybinds)
;;; sys-keybinds.el ends here
