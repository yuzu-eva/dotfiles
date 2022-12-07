;; Control X
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;; Super
(global-set-key (kbd "s-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<up>") 'enlarge-window)
(global-set-key (kbd "<s-C-return>") 'eshell-other-window)

;; Control C
(global-set-key (kbd "C-c r") 'recentf-open-files)
(global-set-key (kbd "C-c t") 'toggle-transparency)
