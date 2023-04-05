#lang racket
(define singleLineCommentRegEx "<[^>]*>//</[^>]*>[^\n]*")
(define delimitedCommentRegEx "<[^>]*>/\\*</[^>]*>(.*)<[^>]*>\\*/</[^>]*>")

(define commentRegex (regexp (string-append singleLineCommentRegEx "|" delimitedCommentRegEx)))

(define commentWrap (lambda m (string-append "<span style=\"color: green\">" (first m) "</span>")))

(define highlightComments (lambda (s) (regexp-replace* commentRegex s commentWrap)))

(provide highlightComments)
