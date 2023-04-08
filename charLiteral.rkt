#lang racket

; Character_Literal
;     : '\'' Character '\''
;     ;
; fragment Character
;     : Single_Character
;     | Simple_Escape_Sequence
;     | Hexadecimal_Escape_Sequence
;     | Unicode_Escape_Sequence
;     ;
; fragment Single_Character
;     // anything but ', \, and New_Line_Character
;     : ~['\\\u000D\u000A\u0085\u2028\u2029]
;     ;

(define hexDigit "[0-9A-Fa-f]")

(define unicodeEscapeSequence
  (string-append
   (string-append "\\\\u" hexDigit hexDigit hexDigit hexDigit)
   "|"
   (string-append "\\\\U" hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit)))

(define hexEscapeSequence (string-append "\\\\x" hexDigit hexDigit "?" hexDigit "?" hexDigit "?"))

(define singleCharacter "[^'\\\\]")

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
  (lambda m (string-append "<span style=\"color: #db8fff\">" (first m) "</span>")))

(define highlightCharLiteral
  (lambda (s) (regexp-replace* characterLiteralRegex s characterLiteralWrapper)))

(provide highlightCharLiteral)
