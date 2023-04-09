#lang racket

(define decimalDigit "[0-9]")

(define decoratedDecimalDigit (string-append "(_*" decimalDigit ")"))

(define realTypeSuffix "[FfDdMm]")

(define sign "[\\+\\-]")

(define exponentPart (string-append "[eE]" sign "?" decimalDigit decoratedDecimalDigit "*"))

(define realLiteral 
  (string-append 
    "\\b(" decimalDigit decoratedDecimalDigit "* <[^>]*>\\.</[^>]*>" decimalDigit decoratedDecimalDigit "*" exponentPart "?" realTypeSuffix "? |"
    "<[^>]*>\\.</[^>]*>" decimalDigit decoratedDecimalDigit "*"  exponentPart "?" realTypeSuffix "? |"
    decimalDigit decoratedDecimalDigit "*" exponentPart realTypeSuffix "? |" 
    decimalDigit decoratedDecimalDigit "*" realTypeSuffix ")\\b" ))

; Regular expressions
(define realLiteralRegex (pregexp realLiteral))

(define realLiteralWrapper
  (lambda m (string-append "<span class=realLiterals>" (first m) "</span>")))

(define highlightRealLiteral (lambda (s) (regexp-replace* realLiteralRegex s realLiteralWrapper)))

(provide highlightRealLiteral)



; Real_Literal
;     : Decimal_Digit Decorated_Decimal_Digit* '.'
;       Decimal_Digit Decorated_Decimal_Digit* Exponent_Part? Real_Type_Suffix?
;     | '.' Decimal_Digit Decorated_Decimal_Digit* Exponent_Part? Real_Type_Suffix?
;     | Decimal_Digit Decorated_Decimal_Digit* Exponent_Part Real_Type_Suffix?
;     | Decimal_Digit Decorated_Decimal_Digit* Real_Type_Suffix
;     ;

; fragment Exponent_Part
;     : ('e' | 'E') Sign? Decimal_Digit Decorated_Decimal_Digit*
;     ;