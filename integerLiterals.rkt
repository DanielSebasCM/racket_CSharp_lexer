#lang racket

; Regular expressions
(define intTypeSuffix "([uU][lL]?|[lL][uU]?)")
(define decoratedDecimalDigit "(_*[0-9])")
(define decimalIntegerLiteral
  (string-append "\\b[0-9]" decoratedDecimalDigit "*" intTypeSuffix "?\\b"))

(define hexDigit "[0-9|A-F|a-f]")
(define decoratedHexDigit (string-append "(_*" hexDigit ")"))
(define hexIntegerLiteral (string-append "\\b(0x|0X)" decoratedHexDigit "+" intTypeSuffix "?\\b"))

(define binaryDigit "(0|1)")
(define decoratedBinaryDigit (string-append "(_*" binaryDigit ")"))
(define binaryIntegerLiteral
  (string-append "\\b(0b|0B)" decoratedBinaryDigit "+" intTypeSuffix "?\\b"))

(define integerLiteral
  (string-append decimalIntegerLiteral "|" hexIntegerLiteral "|" binaryIntegerLiteral))

(define integerLiteralRegEx (pregexp integerLiteral))

(define integerLiteralWrapper
  (lambda m (string-append "<span style=\"color: #ffe869 \">" (first m) "</span>")))

(define highlightIntegerLiteral
  (lambda (s) (regexp-replace* integerLiteralRegEx s integerLiteralWrapper)))

(provide highlightIntegerLiteral)
