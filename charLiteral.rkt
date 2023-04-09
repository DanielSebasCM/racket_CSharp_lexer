#lang racket

(define hexDigit "[0-9A-Fa-f]")

(define unicodeEscapeSequence
  (string-append
   (string-append "\\\\u" hexDigit hexDigit hexDigit hexDigit)
   "|"
   (string-append "\\\\U" hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit)))

(define hexEscapeSequence (string-append "\\\\x" hexDigit hexDigit "?" hexDigit "?" hexDigit "?"))

(define singleCharacter "[^'\\\\(\\\n)]")

(define simpleEscapeSequence "\\\\['\"\\\\abfnrtv0]")

(define character
  (string-append singleCharacter
                 "|"
                 simpleEscapeSequence
                 "|"
                 hexEscapeSequence
                 "|"
                 unicodeEscapeSequence))

(define characterLiteral (string-append "'(" character ")'"))

(define characterLiteralRegex (pregexp characterLiteral))
(define characterLiteralWrapper
  (lambda m (string-append "<span class=charLiteral>" (first m) "</span>")))

(define highlightCharLiteral
  (lambda (s) (regexp-replace* characterLiteralRegex s characterLiteralWrapper)))

(provide highlightCharLiteral)
