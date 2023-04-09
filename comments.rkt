#lang racket
(define singleLineCommentRegEx "<[^>]*>//</[^>]*>[^\n]*")
(define delimitedCommentRegEx "<[^>]*>/\\*</[^>]*>(.*)<[^>]*>\\*/</[^>]*>")

(define commentRegex (regexp (string-append "(?![^<]*>)(" singleLineCommentRegEx "|" delimitedCommentRegEx ")")))

(define commentWrap (lambda m (string-append "<span class=comments>" (first m) "</span>")))

(define highlightComments (lambda (s) (regexp-replace* commentRegex s commentWrap)))

(provide highlightComments)
