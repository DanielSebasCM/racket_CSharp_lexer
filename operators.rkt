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
(define operatorRegEx
  (pregexp (string-append "(" (string-join (map regexp-quote operators) "|") ")+")))

(define operatorWrap (lambda m (string-append "<span style=\"color: blue\">" (first m) "</span>")))

(define highlightOperators (lambda (s) (regexp-replace* operatorRegEx s operatorWrap)))

(provide highlightOperators)
