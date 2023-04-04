#lang racket

; Regular expressions
(define YOUR_REGEX (regexp "YOUR_REGEX"))

(define YOUR_WRAPPER
  (lambda m (string-append "<span style=\"color: YOUR_COLOR\">" (first m) "</span>")))

(define input (file->string "input.txt"))

(define output1 (regexp-replace* YOUR_REGEX input YOUR_WRAPPER))
(define finalOutput (string-append "<pre>" output1 "</pre>"))

(define output-port (open-output-file "output.html" #:exists 'replace))
(write-string finalOutput output-port)
(close-output-port output-port)
