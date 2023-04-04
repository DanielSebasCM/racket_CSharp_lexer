#lang racket

(define keywords
  (list "abstract"
        "as"
        "base"
        "bool"
        "break"
        "byte"
        "case"
        "catch"
        "char"
        "checked"
        "class"
        "const"
        "continue"
        "decimal"
        "default"
        "delegate"
        "do"
        "double"
        "else"
        "enum"
        "event"
        "explicit"
        "extern"
        "false"
        "finally"
        "fixed"
        "float"
        "for"
        "foreach"
        "goto"
        "if"
        "implicit"
        "in"
        "int"
        "interface"
        "internal"
        "is"
        "lock"
        "long"
        "namespace"
        "new"
        "null"
        "object"
        "operator"
        "out"
        "override"
        "params"
        "private"
        "protected"
        "public"
        "readonly"
        "ref"
        "return"
        "sbyte"
        "sealed"
        "short"
        "sizeof"
        "stackalloc"
        "static"
        "string"
        "struct"
        "switch"
        "this"
        "throw"
        "true"
        "try"
        "typeof"
        "uint"
        "ulong"
        "unchecked"
        "unsafe"
        "ushort"
        "using"
        "virtual"
        "void"
        "volatile"
        "while"))
(define keywordRegEx
  (pregexp (string-append "\\b(" (string-join (map regexp-quote keywords) "|") ")\\b")))

(define operators
  (list "{"
        "}"
        "["
        "]"
        "("
        ")"
        "."
        ","
        ":"
        ";"
        "+"
        "-"
        "*"
        "/"
        "%"
        "&"
        "|"
        "^"
        "!"
        "~"
        "="
        "<"
        ">"
        "?"
        "??"
        "::"
        "++"
        "--"
        "&&"
        "||"
        "->"
        "=="
        "!="
        "<="
        ">="
        "+="
        "-="
        "*="
        "/="
        "%="
        "&="
        "|="
        "^="
        "<<"
        "<<="
        "=>"))
(define operatorRegEx (pregexp (string-join (map regexp-quote operators) "|")))

; A single-line comment begins with the characters // and extends to the end of the line.
(define singleLineCommentRegEx (pregexp "//.*"))

; A delimited comment begins with the characters /* and ends with the characters */.
; Delimited comments can occupy a portion of a line, a single line, or multiple lines.

(define input (file->string "input.txt"))

; Replace the captured group with "quack" added to the end
(define keywordWrap (lambda m (string-append "<span style=\"color: red\">" (first m) "</span>")))
(define operatorWrap (lambda m (string-append "<span style=\"color: blue\">" (first m) "</span>")))
(define singleLineCommentWrap
  (lambda m (string-append "<span style=\"color: green\">" (first m) "</span>")))

; (define output1 (regexp-replace* operatorRegEx input operatorWrap))
; (define output2 (regexp-replace* keywordRegEx output1 keywordWrap))
; (displayln output2)

(define temp (regexp-replace* singleLineCommentRegEx input singleLineCommentWrap))
(displayln temp)

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
