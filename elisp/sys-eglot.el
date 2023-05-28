;;; sys-eglot.el --- -*- lexical-binding: t -*-
;;; commentary:
;; Emacs client, cotains setups for C, Js, Py and Ts.
;; Language setup;
;; C - install clangd, which can be gotten by installing clang-tools-extra
;; if you use Fedora that is, look up which package has clangd or you can build
;; and use ccls
;;
;; Js and Ts (JavaScript and TypeScript) - install npm or install nvm and
;; install npm via nvm, install typescript-language-server globally (via npm)
;;
;; Python - install/make sure you have pip installed, install
;; jedi-language-server.  This will install a bunch of packages that are needed
;; for stuff like formatting and the rest (read the docs)
;;
;; Bash - install bash-language-server via npm globally
;;; code:

;; eglot
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(python-mode . ("jedi-language-server")))
  (add-to-list 'eglot-server-programs '(sh-mode . ("bash-language-server" "start")))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'js-mode-hook 'eglot-ensure)
  (add-hook 'typescript-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'sh-mode-hook 'eglot-ensure))

;; Detect Venv automatically and uses eglot on it
;; (defun eglot-detect-virtualenv ()
;;   "Detects if a virtaul environment (venv) is activated for Python."
;;   (let* ((venv-dir-name "Projects")
;; 	 (venv-bin-dir (locate-dominating-file default-directory venv-dir-name)))
;;     (when venv-bin-dir
;;       (let* ((python-executable (concat venv-bin-dir "bin/python"))
;; 	     (venv-name (file-name-base (directory-file-name venv-bin-dir))))
;; 	(setq-local eglot-python-command python-executable)
;; 	(message "Virtual environment activated: %s" venv-name)))))
;; (add-hook 'python-mode-hook 'eglot-detect-virtualenv)

(provide 'sys-eglot)
;;; sys-eglot.el ends here
