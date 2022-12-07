(load "~/.emacs.d/packages" nil t)
(load "~/.emacs.d/functions" nil t)
(load "~/.emacs.d/keybinds" nil t)
(load "~/.emacs.d/config" nil t)

(server-start)
(set-default-file-modes #o700)

;; Load Witchmacs theme
(load-theme 'Witchmacs t)

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
