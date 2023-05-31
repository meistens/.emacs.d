;; sys-org.el --- -*- lexical-binding: t -*-
;;; commentary:
;; Org setup.
;;; code:

;; wrap lines after 80 chars
(setq-default fill-column 80)

;; indents and auto-fill for org files
(defun dm/org-mode-setup ()
  "Org indent, pitch and fill-mode."
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0))

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
   '((emacs-lisp . t)
     (js . t)
     (shell . t)
     (python . t))))

  ;; bullets
  (use-package org-superstar
    :after org
    :hook (org-mode . org-superstar-mode)
    :custom
    (org-superstar-remove-leading-stars t)
    (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

  (font-lock-add-keywords 'org-mode
                          '(("^ +\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

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

(dolist (face '((org-level-1 . 1.5)
                (org-level-2 . 1.4)
                (org-level-3 . 1.3)
                (org-level-4 . 1.2)
                (org-level-5 . 1.1)
                (org-level-6 . 1.0)
                (org-level-7 . 1.0)
                (org-level-8 . 1.0)))
  (set-face-attribute (car face) nil :font "Vazirmatn" :weight 'medium :height (cdr face)))



  ;; org appear
  (use-package org-appear
    :hook (org-mode . org-appear-mode))

;; Org title script
(defun dm/my-org-template ()
  "Insert a template for an org file with a title, author, email, date and tags."
  (interactive)
  (insert (concat "#+TITLE: My Org File\n#+AUTHOR: David Mebo\n#+EMAIL: mebodave@gmail.com\n#+DATE: " (format-time-string "%Y-%m-%d") "\n#+TAGS: \n\n")))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-=") 'dm/my-org-template)))

  (provide 'sys-org)
;;; sys-org.el ends here
