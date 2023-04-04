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



(define brRegEx (regexp "\n"))

(define operatorWrap (lambda m (string-append "<span style=\"color: blue\">" (first m) "</span>")))

(define input (file->string "input.txt"))

(define output1 (regexp-replace* operatorRegEx input operatorWrap))
(define output2 (regexp-replace* brRegEx output1 "<br>"))
(define finalOutput (string-append "<pre>" output2 "</pre>"))

(define output-port (open-output-file "operators.html"))
(write-string finalOutput output-port)
(close-output-port output-port)