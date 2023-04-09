#lang racket

(define hexDigit "[0-9A-Fa-f]")

(define unicodeEscapeSequence
  (string-append
   (string-append "\\\\u" hexDigit hexDigit hexDigit hexDigit)
   "|"
   (string-append "\\\\U" hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit)))

(define hexEscapeSequence (string-append "\\\\x" hexDigit hexDigit "?" hexDigit "?" hexDigit "?"))

(define simpleEscapeSequence "\\\\['\"\\\\abfnrtv0]")

(define singleRegularStringLiteralCharacter "[^\"\\\\]")

(define regularStringLiteralCharacter
  (string-append "("
                 singleRegularStringLiteralCharacter
                 "|"
                 simpleEscapeSequence
                 "|"
                 hexEscapeSequence
                 "|"
                 unicodeEscapeSequence
                 ")"))

(define regularStringLiteral (string-append "\"" regularStringLiteralCharacter "*" "\""))

(define quoteEscapeSequence "\"\"")

(define singleVerbatimStringLiteralCharacter "[^\"]")

(define verbatimStringLiteralCharacter
  (string-append "(" singleVerbatimStringLiteralCharacter "|" quoteEscapeSequence ")"))

(define verbatimStringLiteral (string-append "@\"" verbatimStringLiteralCharacter "*" "\""))

(define stringLiteral (string-append "(" regularStringLiteral "|" verbatimStringLiteral ")"))

(define stringLiteralWrapper
  (lambda m (string-append "<span class=stringLiteral>" (first m) "</span>")))

(define stringLiteralRegEx (pregexp stringLiteral))

(define highlightStringLiteral
  (lambda (s) (regexp-replace* stringLiteralRegEx s stringLiteralWrapper)))

(provide highlightStringLiteral)
