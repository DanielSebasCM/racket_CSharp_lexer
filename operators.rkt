#lang racket

; Regular expressions
(define operators
  (list "{"
        "}"
        "["
        "]"
        "("
        ")"
        "."
        ","
        ":"
        ";"
        "+"
        "-"
        "*"
        "/"
        "%"
        "&"
        "|"
        "^"
        "!"
        "~"
        "="
        "<"
        ">"
        "?"
        "??"
        "::"
        "++"
        "--"
        "&&"
        "||"
        "->"
        "=="
        "!="
        "<="
        ">="
        "+="
        "-="
        "*="
        "/="
        "%="
        "&="
        "|="
        "^="
        "<<"
        "<<="
        "=>"))
(define operatorRegEx (pregexp (string-join (map regexp-quote operators) "|")))

(define operatorWrap (lambda m (string-append "<span style=\"color: blue\">" (first m) "</span>")))

(define input (file->string "input.txt"))

(define output1 (regexp-replace* operatorRegEx input operatorWrap))
(define finalOutput (string-append "<pre>" output1 "</pre>"))

(define output-port (open-output-file "operators.html" #:exists 'replace))
(write-string finalOutput output-port)
(close-output-port output-port)
