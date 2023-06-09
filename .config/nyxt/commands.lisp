(in-package #:nyxt-user)

(define-command-global show-weather ()
  (echo (uiop:run-program "~/.config/nyxt/scripts/weather" :output :string)))

;;opens current url in different browser replace firefox with your browser/path
(define-command-global open-external-browser ()
  "Open the current url in external browser"
  (uiop:run-program (list "firefox-bin" (render-url (url (current-buffer))))))
