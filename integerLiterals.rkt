#lang racket

; Regular expressions
(define intTypeSuffix "([uU][lL]?|[lL][uU]?)")
(define decoratedDecimalDigit "(_*[0-9])")
(define decimalIntegerLiteral
  (string-append "[0-9]" decoratedDecimalDigit "*" intTypeSuffix "?"))

(define hexDigit "[0-9|A-F|a-f]")
(define decoratedHexDigit (string-append "(_*" hexDigit ")"))
(define hexIntegerLiteral (string-append "(0x|0X)" decoratedHexDigit "+" intTypeSuffix "?"))

(define binaryDigit "(0|1)")
(define decoratedBinaryDigit (string-append "(_*" binaryDigit ")"))
(define binaryIntegerLiteral
  (string-append "(0b|0B)" decoratedBinaryDigit "+" intTypeSuffix "?"))

(define integerLiteral
  (string-append "\\b(" decimalIntegerLiteral "|" hexIntegerLiteral "|" binaryIntegerLiteral ")\\s"))

(define integerLiteralRegEx (pregexp integerLiteral))

(define integerLiteralWrapper
  (lambda m (string-append "<span class=integerLiterals>" (first m) "</span>")))

(define highlightIntegerLiteral
  (lambda (s) (regexp-replace* integerLiteralRegEx s integerLiteralWrapper)))

(provide highlightIntegerLiteral)
