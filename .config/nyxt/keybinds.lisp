(in-package #:nyxt-user)

(define-configuration buffer
	((override-map (let ((map (make-keymap "custom-map")))
					 (define-key map
						 "M-I" 'show-weather
						 "C-2" 'open-external-browser
						 "C-x C-b" 'switch-buffer
						 "C-x b" 'list-buffers)
					 map))))

;;;; for some reason this does not work, even though it's from the manual
;; (define-configuration base-mode
;; 	((keyscheme-map
;; 	  (define-keyscheme-map "my-base" (list :import %slot-value%)
;; 		keyscheme:emacs
;; 		(list
;; 		 "C-x C-b" NIL)))))
