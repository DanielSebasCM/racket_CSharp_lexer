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

(define singleLineCommentRegEx "//[^\n]*")
(define delimitedCommentRegEx "/\\*(.*)\\*/")

(define commentRegex (regexp (string-append singleLineCommentRegEx "|" delimitedCommentRegEx)))

(define brRegEx (regexp "\n"))

(define input (file->string "input.txt"))

; Replace the captured group with "quack" added to the end
(define keywordWrap (lambda m (string-append "<span style=\"color: red\">" (first m) "</span>")))
(define operatorWrap (lambda m (string-append "<span style=\"color: blue\">" (first m) "</span>")))
(define commentWrap (lambda m (string-append "<span style=\"color: green\">" (first m) "</span>")))

(define output1 (regexp-replace* operatorRegEx input operatorWrap))
(define output2 (regexp-replace* keywordRegEx output1 keywordWrap))
(define output3 (regexp-replace* commentRegex output2 commentWrap))
(define output4 (regexp-replace* brRegEx output3 "<br>"))
(define finalOutput (string-append "<pre>" output4 "</pre>"))

(define output-port (open-output-file "main.html"))
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
