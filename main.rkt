#lang racket
(require "comments.rkt")
(require "keywords.rkt")
(require "operators.rkt")
(require "charLiteral.rkt")
(require "integerLiterals.rkt")
(require "realLiterals.rkt")
(require "stringLiteral.rkt")

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
