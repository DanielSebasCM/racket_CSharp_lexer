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

(define operatorWrapper (lambda m (string-append "<span class=operators>" (first m) "</span>")))

(define highlightOperators (lambda (s) (regexp-replace* operatorRegEx s operatorWrapper)))

(provide highlightOperators)