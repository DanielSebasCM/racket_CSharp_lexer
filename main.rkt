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
  (highlightComments (highlightStringLiteral (highlightIntegerLiteral (highlightKeywords (highlightCharLiteral (highlightOperators input)))))))

(define finalOutput
  (string-append "<head> <link rel='stylesheet' href='styles.css'> <title>problemSituation</title> </head><style>span *{color:inherit !important}</style><pre>" output3 "</pre>"))

(define output-port (open-output-file "main.html" #:exists 'replace))
(write-string finalOutput output-port)
(close-output-port output-port)

; TOKENS
; token
;     : keyword
;     | operator_or_punctuator
;     ;

; keyword
;     : 'abstract' | 'as'       | 'base'       | 'bool'      | 'break'
;     | 'byte'     | 'case'     | 'catch'      | 'char'      | 'checked'
;     | 'class'    | 'const'    | 'continue'   | 'decimal'   | DEFAULT
;     | 'delegate' | 'do'       | 'double'     | 'else'      | 'enum'
;     | 'event'    | 'explicit' | 'extern'     | FALSE       | 'finally'
;     | 'fixed'    | 'float'    | 'for'        | 'foreach'   | 'goto'
;     | 'if'       | 'implicit' | 'in'         | 'int'       | 'interface'
;     | 'internal' | 'is'       | 'lock'       | 'long'      | 'namespace'
;     | 'new'      | NULL       | 'object'     | 'operator'  | 'out'
;     | 'override' | 'params'   | 'private'    | 'protected' | 'public'
;     | 'readonly' | 'ref'      | 'return'     | 'sbyte'     | 'sealed'
;     | 'short'    | 'sizeof'   | 'stackalloc' | 'static'    | 'string'
;     | 'struct'   | 'switch'   | 'this'       | 'throw'     | TRUE
;     | 'try'      | 'typeof'   | 'uint'       | 'ulong'     | 'unchecked'
;     | 'unsafe'   | 'ushort'   | 'using'      | 'virtual'   | 'void'
;     | 'volatile' | 'while'
;     ;

; operator_or_punctuator
;     : '{'  | '}'  | '['  | ']'  | '('   | ')'  | '.'  | ','  | ':'  | ';'
;     | '+'  | '-'  | ASTERISK    | SLASH | '%'  | '&'  | '|'  | '^'  | '!' | '~'
;     | '='  | '<'  | '>'  | '?'  | '??'  | '::' | '++' | '--' | '&&' | '||'
;     | '->' | '==' | '!=' | '<=' | '>='  | '+=' | '-=' | '*=' | '/=' | '%='
;     | '&=' | '|=' | '^=' | '<<' | '<<=' | '=>'
;     ;
