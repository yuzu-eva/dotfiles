(in-package #:nyxt-user)

;; this automatically darkens Webkit-native interfaces and sends the
;; "prefers-color-scheme: dark" to all the supporting websites.
(setf (uiop:getenv "GTK_THEME") "Adwaita:dark")

(define-configuration browser
	((theme (make-instance
			 'theme:theme
			 :background-color "#000000"
			 :accent-color "#CD5C5C"
			 :accent-alt-color "#6C2429"
			 :warning-color "#CEFF00"
			 :primary-color "rgb(170, 170, 170)"
			 :secondary-color "rgb(100, 100, 100)"))))

(define-configuration :dark-mode
	"Overriding the ugly gray-ish default colors"
  ((style
	(theme:themed-css (theme *browser*)
					  `(*
						:background-color ,(if (theme:dark-p theme:theme)
											   theme:background
											   theme:on-background)
						"!important"
						:background-image none "!important"
						:color ,(if (theme:dark-p theme:theme)
									theme:on-background
									theme:background)
						"!important")
						`(a
						  :background-color ,(if (theme:dark-p theme:theme)
												 theme:background
												 theme:on-background)
						  "!important"
						  :background-image none "!important"
						  :color ,theme:primary "!important")))))
