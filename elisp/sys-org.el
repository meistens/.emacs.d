;; sys-org.el --- -*- lexical-binding: t -*-
;;; commentary:
;;; code:

;; wrap lines after 80 chars
(setq-default fill-column 80)

;; indents and auto-fill for org files
(defun dm/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1))

;; Org
(use-package org
  :defer t
  :hook (org-mode . dm/org-mode-setup)
  :config
  (setq org-ellipsis " ⤵"
	org-hide-emphasis-markers t
	org-src-tab-acts-natively t
	org-edit-src-content-indentation 2
	org-hide-block-startup nil
	org-src-preserve-indentation nil
	org-cycle-separator-lines 2)

  ;; babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t))))

;; bullets
(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                          (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;; its fugly but its my config, edit the values as you wish (and byy edit, i
;; mean the "1.x" value)
(dolist (face '((org-level-1 . 1.8)
                (org-level-2 . 1.7)
                (org-level-3 . 1.6)
                (org-level-4 . 1.5)
                (org-level-5 . 1.4)
                (org-level-6 . 1.3)
                (org-level-7 . 1.2)
                (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Iosevka Term SS18" :weight 'regular :height (cdr face)))

;; Make sure org-indent face is available
(require 'org-indent)

;; fixed pitch doublechecks
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

;; Get rid of the background on column views
(set-face-attribute 'org-column nil :background nil)
(set-face-attribute 'org-column-title nil :background nil)

;; org tempo
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("json" . "src json"))

;; org appear
(use-package org-appear
  :hook (org-mode . org-appear-mode))

(provide 'sys-org)
;;; sys-org.el ends here
