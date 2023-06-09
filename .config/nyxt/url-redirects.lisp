(in-package #:nyxt-user)

(defparameter old-reddit-handler
  (url-dispatching-handler
   'old-reddit-dispatcher
   (match-regex "https?\:\/\/?.*?reddit\.com")
   (lambda (url)
	 (quri:copy-uri url :host "old.reddit.com"))))

(defparameter invidious-handler
  (url-dispatching-handler
   'invidious-dispatcher
   (match-regex "https?\:\/\/?.*?(?:youtube\.com|youtu\.be|youtube-nocookie\.com).*")
   (lambda (url)
	 (quri:copy-uri url :host "invidious.cafebabe.gay"))))

(defparameter wikiless-handler
  (url-dispatching-handler
   'wikiless-dispatcher
   (match-regex "https?\:\/\/?.*?wikipedia\.org.*")
   (lambda (url)
	 (quri:copy-uri url :host "wikiless.org"))))

(define-configuration buffer
	((request-resource-hook
	  (reduce #'hooks:add-hook
			  (list old-reddit-handler
					invidious-handler
					wikiless-handler)
			  :initial-value %slot-default%))))
