#lang racket

; Regular expressions
(define keywords
  (list "abstract"
        "as"
        "base"
        "bool"
        "break"
        "byte"
        "case"
        "catch"
        "char"
        "checked"
        "class"
        "const"
        "continue"
        "decimal"
        "default"
        "delegate"
        "do"
        "double"
        "else"
        "enum"
        "event"
        "explicit"
        "extern"
        "false"
        "finally"
        "fixed"
        "float"
        "for"
        "foreach"
        "goto"
        "if"
        "implicit"
        "in"
        "int"
        "interface"
        "internal"
        "is"
        "lock"
        "long"
        "namespace"
        "new"
        "null"
        "object"
        "operator"
        "out"
        "override"
        "params"
        "private"
        "protected"
        "public"
        "readonly"
        "ref"
        "return"
        "sbyte"
        "sealed"
        "short"
        "sizeof"
        "stackalloc"
        "static"
        "string"
        "struct"
        "switch"
        "this"
        "throw"
        "true"
        "try"
        "typeof"
        "uint"
        "ulong"
        "unchecked"
        "unsafe"
        "ushort"
        "using"
        "virtual"
        "void"
        "volatile"
        "while"))
(define keywordRegEx
  (pregexp (string-append "\\b(" (string-join (map regexp-quote keywords) "|") ")\\b")))

(define keywordWrap (lambda m (string-append "<span style=\"color: red\">" (first m) "</span>")))

(define input (file->string "input.txt"))

(define output1 (regexp-replace* keywordRegEx input keywordWrap))
(define finalOutput (string-append "<pre>" output1 "</pre>"))

(define output-port (open-output-file "keywords.html"))
(write-string finalOutput output-port)
(close-output-port output-port)
