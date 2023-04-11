#lang racket
; Regular expressions
(define YOUR_REGEX (regexp "YOUR_REGEX"))

(define YOUR_WRAPPER
  (lambda m (string-append "<span style=\"color: YOUR_COLOR\">" (first m) "</span>")))

(define YOUR_HIGHLIGTH (lambda (s) (regexp-replace* YOUR_REGEX s YOUR_WRAPPER)))

(provide YOUR_HIGHLIGTH)
