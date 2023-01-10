;;; org.el --- lexical-binding: t -*-
;;; commentary:
;;; code:

;; org
;; (use-package org)
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; babel
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp . t)
;;    (python . t)
;;    (C . t)
;;    (org . t)))
;; (setq org-confirm-babel-evaluate nil)


;; ;; tempo
;; (require 'org-tempo)
;; (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
;; (add-to-list 'org-structure-template-alist '("py" . "src python"))
;; (add-to-list 'org-structure-template-alist '("sh" . "src shell"))

(provide 'org)
;;; org.el ends here
