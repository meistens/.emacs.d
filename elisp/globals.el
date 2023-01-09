;;; globals.el --- -*- lexical-binding: t -*-
;;; commentary:
;;; code:

;; Basic info
;; (setq user-full-name "David Mebo")
;; (setq user-mail-address "mebodave@gmail.com")

;; Unbind unneeded keys
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "M-z") nil)
(global-set-key (kbd "M-m") nil)
(global-set-key (kbd "C-x C-z") nil)
(global-set-key (kbd "M-/") nil)
;; Truncate lines
(global-set-key (kbd "C-x C-l") #'toggle-truncate-lines)
;; Adjust font size like web browsers
(global-set-key (kbd "C-=") #'text-scale-increase)
(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C--") #'text-scale-decrease)
;; Move up/down paragraph
(global-set-key (kbd "M-n") #'forward-paragraph)
(global-set-key (kbd "M-p") #'backward-paragraph)

;; ivy, amx, counsel, swiper
(use-package ivy
  :diminish
  :init
  (use-package amx :defer t)
  (use-package counsel :diminish :config (counsel-mode 1))
  (use-package swiper :defer t)
  (ivy-mode 1)
  :bind
  (("C-s" . swiper-isearch)
   ("C-z s" . counsel-rg)
   ("C-z b" . counsel-buffer-or-recentf)
   ("C-z C-b" . counsel-ibuffer)
   (:map ivy-minibuffer-map
         ("M-RET" . ivy-immediate-done))
   (:map counsel-find-file-map
         ("C-~" . counsel-goto-local-home)))
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-height 10)
  (ivy-on-del-error-function nil)
  (ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-create)
  (ivy-count-format "【%d/%d】")
  (ivy-wrap t)
  :config
  (defun counsel-goto-local-home ()
      "Go to the $HOME of the local machine."
      (interactive)
      (ivy--cd "~/")))

;; color rg, make sure ripgrep is installed in PATH
(use-package color-rg
  :load-path (lambda () (expand-file-name "site-elisp/color-rg" user-emacs-directory))
  :if (executable-find "rg")
  :bind ("C-M-s" . color-rg-search-input))


;; dired
;; (use-package dired
;;   :ensure nil
;;   :bind
;;   (("C-x C-j" . dired-jump))
;;   :custom
;;   ;; Always delete and copy recursively
;;   (dired-listing-switches "-lah")
;;   (dired-recursive-deletes 'always)
;;   (dired-recursive-copies 'always)
;;   ;; Auto refresh Dired, but be quiet about it
;;   (global-auto-revert-non-file-buffers t)
;;   (auto-revert-verbose nil)
;;   ;; Quickly copy/move file in Dired
;;   (dired-dwim-target t)
;;   ;; Move files to trash when deleting
;;   (delete-by-moving-to-trash t)
;;   ;; Load the newest version of a file
;;   (load-prefer-newer t)
;;   ;; Detect external file changes and auto refresh file
;;   (auto-revert-use-notify nil)
;;   (auto-revert-interval 3) ; Auto revert every 3 sec
;;   :config
;;   ;; Enable global auto-revert
;;   (global-auto-revert-mode t)
;;   ;; Reuse same dired buffer, to prevent numerous buffers while navigati;; ng in dired
;;   (put 'dired-find-alternate-file 'disabled nil)
;;   :hook
;;   (dired-mode . (lambda ()
;;                   (local-set-key (kbd "<mouse-2>") #'dired-find-alternat;; e-file)
;;                   (local-set-key (kbd "RET") #'dired-find-alternate-file)
;;                   (local-set-key (kbd "^")
;;                                  (lambda () (interactive) (find-alternat;; e-file ".."))))))

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

;; ibuffer
;; (use-package ibuffer
;;  :ensure nil
;;  :bind ("C-x C-b" . ibuffer)
;;  :init
;;  (use-package ibuffer-vc
;;  :commands (ibuffer-vc-set-filter-groups-by-vc-root)
;;    :custom
;;    (ibuffer-vc-skip-if-remote 'nil))
;;  :custom
;;  (ibuffer-formats
 ;;  '((mark modified read-only locked " "
   ;;        (name 35 35 :left :elide)
     ;;      " "
       ;;    (size 9 -1 :right)
         ;;  " "
         ;;  (mode 16 16 :left :elide)
           ;;" " filename-and-process)
    ;; (mark " "
      ;;     (name 16 -1)
        ;;   " " filename))))

;; trash backup files
(setq backup-directory-alist            '((".*" . "~/.Trash")))

(provide 'globals)
;;; globals.el ends here
