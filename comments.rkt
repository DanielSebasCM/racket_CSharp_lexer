#lang racket
(define singleLineCommentRegEx "<[^>]*>//</[^>]*>[^\n]*")
(define delimitedCommentRegEx "<[^>]*>/\\*</[^>]*>(.*)<[^>]*>\\*/</[^>]*>")

(define commentRegex (regexp (string-append singleLineCommentRegEx "|" delimitedCommentRegEx)))

(define commentWrapper (lambda m (string-append "<span style=\"color: #1E8449\">" (first m) "</span>")))

(define highlightComments (lambda (s) (regexp-replace* commentRegex s commentWrapper)))

(provide highlightComments)
