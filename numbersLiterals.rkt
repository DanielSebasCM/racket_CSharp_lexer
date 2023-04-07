#lang racket

; Regular expressions
(define intTypeSuffix "[UL | Ul | uL | ul | LU | Lu | lU | lu | U | u | L | l]")
(define decoratedDecimalDigit "(_*[0-9])")
(define decimalIntegerLiteral (string-append "\\b[0-9]" decoratedDecimalDigit "*\\b"))

(define hexDigit "[0-9|A-F|a-f]")
(define decoratedHexDigit (string-append "(_*" hexDigit ")"))
(define hexIntegerLiteral (string-append "\\b(0x|0X)" decoratedHexDigit "+\\b"))

(define binaryDigit "0|1")
(define decoratedBinaryDigit (string-append "(_*" binaryDigit ")"))
(define binaryIntegerLiteral (string-append "\\b(0b|0B)" decoratedBinaryDigit "+\\b"))

(define integerLiteral (string-append "\\b" decimalIntegerLiteral "|" hexIntegerLiteral "|" binaryIntegerLiteral "\\b"))

(define integerLiteralWrap
  (lambda m (string-append "<span style=\"color: yellow\">" (first m) "</span>")))

(define input (file->string "input.txt"))

(define output1 (regexp-replace* integerLiteral integerLiteralWrap input))
(define finalOutput (string-append "<pre>" output1 "</pre>"))

(define output-port (open-output-file "intLiteral.html" #:exists 'replace))
(write-string finalOutput output-port)
(close-output-port output-port)
