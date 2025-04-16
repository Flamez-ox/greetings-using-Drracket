#lang racket

(require web-server/servlet
         web-server/servlet-env
         racket/date)

;; Get dynamic greeting based on system time
(define (get-greeting)
  (define hour (date-hour (current-date)))
  (cond
    [(< hour 12) "Good Morning"]
    [(< hour 17) "Good Afternoon"]
    [else "Good Evening"]))

;; Build the HTML response
(define (start request)
  (define greeting (get-greeting))
  (response/xexpr
   `(html
     (head
      (title "HAHAH")
      (style "body { background-color:lightgray; font-family: sans-serif; padding: 2em; }"))
     (body
      (h1 ,greeting)
      (p "Save yourself!  Nobody will!.")))))

;; Start the web server
(serve/servlet start
               #:launch-browser? #t
               #:servlet-path "/"
               #:port 8000
               #:servlet-regexp #rx"")
