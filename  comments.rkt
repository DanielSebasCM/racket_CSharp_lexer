#lang racket

(define singleLineCommentRegEx "//[^\n]*")
(define delimitedCommentRegEx "/\\*(.*)\\*/")

(define commentRegex (regexp (string-append singleLineCommentRegEx "|" delimitedCommentRegEx)))
(define brRegEx (regexp "\n"))

(define commentWrap (lambda m (string-append "<span style=\"color: green\">" (first m) "</span>")))

(define input (file->string "input.txt"))

(define output1 (regexp-replace* commentRegex input commentWrap))
(define output2 (regexp-replace* brRegEx output1 "<br>"))
(define finalOutput (string-append "<pre>" output2 "</pre>"))

(define output-port (open-output-file "comments.html"))
(write-string finalOutput output-port)
(close-output-port output-port)