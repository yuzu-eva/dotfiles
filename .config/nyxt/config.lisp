(in-package #:nyxt-user)

(reset-asdf-registries)

(defvar *web-buffer-modes*
  '(:emacs-mode
	:blocker-mode
	:force-https-mode
	:reduce-tracking-mode
	:user-script-mode
	:no-script-mode
	:no-webgl-mode))

(define-nyxt-user-system-and-load nyxt-user/basic-config
	:components ("commands" "keybinds" "status" "url-redirects" "themes/cafebabe-dark.lisp"))

;;; EXAMPLE
;; (define-nyxt-user-system-and-load "nyxt-user/nx-fruit-proxy"
;; 	:description "This proxy system saves us if nx-fruit fails to load.
;; Otherwise it will break all the config loading."
;; 	:depends-on ("nx-fruit"))

(define-nyxt-user-system-and-load "nyxt-user/search-engines"
	:depends-on (:nx-search-engines) :components ("search-engines"))

(define-configuration browser
	((restore-session-on-startup-p nil)
	 (remote-execution-p t)
	 (external-editor-program
	  (list "emacsclient" "-cn" "-a" "" "-F"))))

(define-configuration nyxt/mode/user-script:user-script-mode
	((nyxt/mode/user-script:user-scripts
	  (list
	   (make-instance 'nyxt/mode/user-script:user-script :base-path #p"~/.config/nyxt/scripts/4chan-x.user.js")
	   (make-instance 'nyxt/mode/user-script:user-script :base-path #p"~/.config/nyxt/scripts/onee-chan.user.js")))))

(define-configuration nyxt/mode/proxy:proxy-mode
  ((nyxt/mode/proxy:proxy (make-instance 'proxy
                                         :url (quri:uri "socks5://localhost:9050")
                                         :allowlist '("localhost" "localhost:8080")
                                         :proxied-downloads-p t))))

(define-configuration (:modable-buffer :prompt-buffer :editor-buffer)
	((default-modes `(:emacs-mode ,@%slot-value%))))

(define-configuration :prompt-buffer
	((dynamic-attribute-width-p t)))

(define-configuration :web-buffer
	((search-always-auto-complete-p nil)
	 (global-history-p t)))

(define-configuration :browser
	((default-new-buffer-url (quri:uri "nyxt:nyxt/mode/repl:repl"))))

(define-configuration :web-buffer
	((default-modes `(,@*web-buffer-modes* ,@%slot-value%))))

(define-configuration :reduce-tracking-mode
	((query-tracking-parameters
	  (append '("utm_source" "utm_medium" "utm_campaign" "utm_term" "utm_content")
			  %slot-value%))
	  (preferred-user-agent
	   "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36")))
