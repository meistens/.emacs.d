;;; early-init.el --- -*- lexical-binding: t -*-
;;; commentary:
;; early init file
;;; code:

;; garbage collection
(setq gc-cons-threshold 100000000)


;; enable packages at startup
(setq package-enable-at-startup nil)


;; file name handler
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)


;; UnsetSRF
(setq site-run-file nil)

;; menu bar
(menu-bar-mode -1)

;; scroll bar
(scroll-bar-mode -1)

;; tool bar
(tool-bar-mode 0)

(provide 'early-init)
;;; early-init.el ends here
