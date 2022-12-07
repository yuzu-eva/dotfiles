(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))
 
(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
    gc-cons-percentage 0.1))
 
(defun split-and-follow-horizontally ()
      (interactive)
      (split-window-below)
      (balance-windows)
      (other-window 1))

(defun split-and-follow-vertically ()
      (interactive)
      (split-window-right)
      (balance-windows)
      (other-window 1))

(defun toggle-transparency()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
	(set-frame-parameter
	 nil 'alpha
	 (if (eql (cond ((numberp alpha) alpha)
					((numberp (cdr alpha)) (cdr alpha))
					;; Also handle undocumented (<active> <inactive>) form.
					((numberp (cadr alpha)) (cadr alpha)))
			  100)
		 '(80 . 80) '(100 . 100)))))

(defun eshell/sudo-open (filename)
  "Open a file as root in Eshell."
  (let ((qual-filename (if (string-match "^/" filename)
                           filename
                         (concat (expand-file-name (eshell/pwd)) "/" filename))))
    (switch-to-buffer
     (find-file-noselect
      (concat "/sudo::" qual-filename)))))

(defun eshell-other-window ()
  "Create or visit an eshell buffer."
  (interactive)
  (if (not (get-buffer "*eshell*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (eshell))
    (switch-to-buffer-other-window "*eshell*")))
