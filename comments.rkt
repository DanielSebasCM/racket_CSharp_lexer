#lang racket

(define operatorSafe (lambda (s) (string-append "<[^/>]*>" s "</[^>]*>")))

(define singleLineCommentRegEx (string-append (operatorSafe "//") "[^\n]*"))
(define delimitedCommentRegEx (string-append (operatorSafe "/\\*") "(.*)" (operatorSafe "\\*/")))

(define commentRegex (regexp (string-append singleLineCommentRegEx "|" delimitedCommentRegEx)))

(define commentWrap (lambda m (string-append "<span class=comments>" (first m) "</span>")))

(define highlightComments (lambda (s) (regexp-replace* commentRegex s commentWrap)))

(provide highlightComments)
