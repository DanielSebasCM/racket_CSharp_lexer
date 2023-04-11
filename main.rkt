#lang racket
(require "rkts/comments.rkt")
(require "rkts/keywords.rkt")
(require "rkts/operators.rkt")
(require "rkts/charLiteral.rkt")
(require "rkts/integerLiterals.rkt")
(require "rkts/realLiterals.rkt")
(require "rkts/stringLiteral.rkt")

; based on https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/lexical-structure

(define input (file->string "input.txt"))

(define output3
  (highlightIntegerLiteral
   (highlightRealLiteral
    (highlightStringLiteral
     (highlightCharLiteral (highlightKeywords (highlightComments (highlightOperators input))))))))

(define finalOutput
  (string-append
   "<head> <link rel='stylesheet' href='styles.css'> <title>problemSituation</title> </head><style>span *{color:inherit !important}</style><pre>"
   output3
   "</pre>"))

(define output-port (open-output-file "main.html" #:exists 'replace))
(write-string finalOutput output-port)
(close-output-port output-port)
