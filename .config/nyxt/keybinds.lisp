(in-package #:nyxt-user)

(define-configuration buffer
	((override-map (let ((map (make-keymap "my-override-map")))
					 (define-key map
						 "M-I" 'show-weather
						 "C-2" 'open-external-browser)
					 map))))
