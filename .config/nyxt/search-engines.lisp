(in-package #:nyxt-user)

(defvar *duckduckgo-keywords*
  '(:theme :dark
    :help-improve-duckduckgo nil
    :homepage-privacy-tips nil
    :privacy-newsletter nil
    :newsletter-reminders nil
    :install-reminders nil
    :install-duckduckgo nil
    :units-of-measure :metric
    :keyboard-shortcuts t
    :advertisements nil
    :open-in-new-tab nil
    :infinite-scroll t
    :safe-search :off
    :font-size :medium
    :header-behavior :on-fixed
    :font :helvetica
    :background-color "000000")
  "My DDG settings, shared between the usual, image-search and other
types of DuckDuckGo.")

(define-configuration (buffer web-buffer)
	((search-engines (list (engines:duckduckgo-html-only :shortcut "dho")
						   (apply #'engines:duckduckgo
								  :shortcut "d" *duckduckgo-keywords*)
						   (apply #'engines:duckduckgo-images
								  :shortcut "i" *duckduckgo-keywords*)
						   (make-instance 'search-engine
										  :shortcut "aw"
										  :search-url "https://wiki.archlinux.org/index.php?search=~a&title=Special%3ASearch&fulltext=Search"
										  :fallback-url "https://wiki.archlinux.org")
						   (make-instance 'search-engine
										  :shortcut "gen"
										  :search-url "https://wiki.gentoo.org/index.php?title=Sepcial%3ASearch&search=~a&go=Go"
										  :fallback-url "https://wiki.gentoo.org")
						   (make-instance 'search-engine
										  :shortcut "lbx"
										  :search-url "https://search.cafebabe.gay/search.php?q=~a"
										  :fallback-url "https://search.cafebabe.gay")
						   (engines:invidious
							:shortcut "yt"
							:base-search-url "https://invidious.cafebabe.gay/search?q=~a"
							:fallback-url "https://invidious.cafebabe.gay")))))
