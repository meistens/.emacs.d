;;; sys-keybinds.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; File for all keybinds.  Make sure no conflicts with predefined keybinds
;;; Code:

;; liveserver start
(global-set-key (kbd "C-c l") 'dm/start-impatient-server)

(provide 'sys-keybinds)
;;; sys-keybinds.el ends here
