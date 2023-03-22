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

;; liveserver
(use-package impatient-mode
  :config
  (defun dm/start-impatient-server ()
    (interactive)
    (let ((buf (current-buffer)))
      (with-current-buffer buf
	(httpd-start)
	(imp-visit-buffer)
	(add-hook 'kill-buffer-hook #'httpd-stop nil t)))))

(provide 'sys-web)
;;; sys-web.el ends here
