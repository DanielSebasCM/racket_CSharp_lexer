#lang racket
(define singleLineCommentRegEx "//[^\n]*")
(define delimitedCommentRegEx "/\\*(.*)\\*/")

(define commentRegex (regexp (string-append singleLineCommentRegEx "|" delimitedCommentRegEx)))

(define commentWrap (lambda m (string-append "<span style=\"color: green\">" (first m) "</span>")))

(define input (file->string "input.txt"))

(define output1 (regexp-replace* commentRegex input commentWrap))
(define finalOutput (string-append "<pre>" output1 "</pre>"))

(define output-port (open-output-file "comments.html" #:exists 'replace))
(write-string finalOutput output-port)
(close-output-port output-port)
