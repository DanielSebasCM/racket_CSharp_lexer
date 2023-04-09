#lang racket

(define operatorSafe (lambda (s) (string-append "(<[^/>]*>" s "</[^>]*>)")))

(define decimalDigit "[0-9]")

(define decoratedDecimalDigit (string-append "(_*" decimalDigit ")"))

(define realTypeSuffix "[FfDdMm]")

(define sign (operatorSafe "(\\+|-)"))

(define exponentPart (string-append "([eE]" sign "?" decimalDigit decoratedDecimalDigit "*)"))

(define realLiteral
  (string-append
   "\\s(" decimalDigit decoratedDecimalDigit "*" (operatorSafe "\\.") decimalDigit decoratedDecimalDigit "*" exponentPart "?" realTypeSuffix "?|"
   (operatorSafe "\\.") decimalDigit decoratedDecimalDigit "*" exponentPart "?" realTypeSuffix "?|"
   decimalDigit decoratedDecimalDigit "*" exponentPart realTypeSuffix "?|"
   decimalDigit decoratedDecimalDigit "*" realTypeSuffix ")\\b" ))

; Regular expressions
(define realLiteralRegex (pregexp realLiteral))

(define realLiteralWrapper
  (lambda m (string-append "<span class=realLiterals>" (first m) "</span>")))

(define highlightRealLiteral (lambda (s) (regexp-replace* realLiteralRegex s realLiteralWrapper)))

(provide highlightRealLiteral)