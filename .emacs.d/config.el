(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

(show-paren-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-prettify-symbols-mode t)
(electric-pair-mode t)
(global-hl-line-mode t)
(recentf-mode 1)
(savehist-mode 1)
(global-auto-revert-mode 1)

(set-frame-parameter (selected-frame) 'alpha '(80 . 80))
(add-to-list 'default-frame-alist '(alpha .(80 . 80)))

(defvar startup/file-name-handler-alist file-name-handler-alist)

(defalias 'open 'find-file-other-window)
(defalias 'clean 'eshell/clear-scrollback)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Make emacs startup faster
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(setq-default major-mode 'text-mode)

(setq inhibit-startup-message t)
(setq x-select-enable-clipboard t)
(setq make-backup-files nil)
(setq scroll-conservatively 100)
(setq ring-bell-function 'ignore)
(setq history-length 25)
(setq global-auto-revert-non-file-buffers t)

(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq c-basic-offset tab-width)
(setq-default electric-indent-inhibit t)
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method 'nil)


(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")
                            ))

(setq use-package-always-defer t)

(setq eshell-prompt-regexp "^[^αλ\n]*[αλ] ")
(setq eshell-prompt-function
      (lambda nil
        (concat
         (if (string= (eshell/pwd) (getenv "HOME"))
             (propertize "~" 'face `(:foreground "#99CCFF"))
           (replace-regexp-in-string
            (getenv "HOME")
            (propertize "~" 'face `(:foreground "#99CCFF"))
            (propertize (eshell/pwd) 'face `(:foreground "#99CCFF"))))
         (if (= (user-uid) 0)
             (propertize " α " 'face `(:foreground "#FF6666"))
         (propertize " λ " 'face `(:foreground "#A6E22E"))))))

(setq eshell-highlight-prompt nil)
(setq file-name-handler-alist nil)

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
