;;; sys-web.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; configs for HTML, CSS and a liveserver only, no frameworks
;;; Code:

;; emmet mode
(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode))

;; web-mode
(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
	 ("\\.css\\'" . web-mode))
  :init
  (setq web-mode-markup-indent-offset 2
	web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t
        web-mode-enable-auto-pairing t
        web-mode-enable-auto-closing t
        web-mode-enable-auto-opening t
        web-mode-enable-auto-indentation t
        web-mode-enable-css-colorization t
	web-mode-enable-auto-quoting t)
  :config
  (setq web-mode-engines-alist '((".\\.html\\'"))
	web-mode-enable-engine-detection t))

;; rainbow-mode
(use-package rainbow-mode
  :ensure t
  :hook (css-mode))

;; simple-httpd
(use-package simple-httpd
  :ensure t)
  ;; :config
  ;; (setq httpd-root "var/www/")
  ;; (defun start-httpd-server ()
  ;;   (interactive)
  ;;   (httpd-start)
  ;;   (message "HTTP server started on port %s"
  ;; 	     (httpd-port))))

;; security isssues, use at your own risk
;; (use-package impatient-mode
;;   :hook (web-mode . impatient-mode)
;;   :config
;;   (defun start-impatient-server ()
;;     (interactive)
;;     (httpd-start)
;;     (impatient-mode)
;;     (message "Impatient mode started on port 8080")))



(provide 'sys-web)
;;; sys-web.el ends here
