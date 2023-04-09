; String_Literal
;     : Regular_String_Literal
;     | Verbatim_String_Literal
;     ;

; fragment Regular_String_Literal
;     : '"' Regular_String_Literal_Character* '"'
;     ;

; fragment Regular_String_Literal_Character
;     : Single_Regular_String_Literal_Character
;     | Simple_Escape_Sequence
;     | Hexadecimal_Escape_Sequence
;     | Unicode_Escape_Sequence
;     ;

; fragment Single_Regular_String_Literal_Character
;     // anything but ", \, and New_Line_Character
;     : ~["\\\u000D\u000A\u0085\u2028\u2029]
;     ;

; fragment Verbatim_String_Literal
;     : '@"' Verbatim_String_Literal_Character* '"'
;     ;

; fragment Verbatim_String_Literal_Character
;     : Single_Verbatim_String_Literal_Character
;     | Quote_Escape_Sequence
;     ;

; fragment Single_Verbatim_String_Literal_Character
;     : ~["]     // anything but quotation mark (U+0022)
;     ;

; fragment Quote_Escape_Sequence
;     : '""'
;     ;

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

(define stringLiteral (string-append "(?![^<]*>)(" regularStringLiteral "|" verbatimStringLiteral ")"))

(define stringLiteralWrapper
  (lambda m (string-append "<span class=stringLiteral>" (first m) "</span>")))

(define stringLiteralRegEx (pregexp stringLiteral))

(define highlightStringLiteral
  (lambda (s) (regexp-replace* stringLiteralRegEx s stringLiteralWrapper)))

(provide highlightStringLiteral)
