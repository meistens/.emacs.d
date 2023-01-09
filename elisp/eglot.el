;;; eglot.el --- -*- lexical-binding: t -*-
;;; commentary:
;;; code:
;; eglot
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(javascript-mode . ("javascript-typescript-stdio")))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'javascript-mode-hook 'eglot-ensure))

(provide 'eglot)
;;; eglot.el ends here
