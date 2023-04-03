#lang racket
(require racket/list)

(define tocken-regex #rx"[a-zA-Z0-9]+|[{}();,.]")
(define member? (lambda (v lst [eq-fn eq?]) (number? (index-of lst v eq-fn))))

;; read lines
(define (read-lines-from-file input-port)
  (let loop ([input-port input-port] [lines '()])
    (define line (read-line input-port))
    (cond
      [(eof-object? line) (reverse lines)] ; reverse the list to match the file order
      [else (loop input-port (cons (string-trim line #:left? #f) lines))]))) ; append line to list

(define reserved-words (read-lines-from-file (open-input-file "reserved-words.txt")))
(define lines (read-lines-from-file (open-input-file "test.txt")))

(define first-word (first (regexp-match* tocken-regex (first lines))))

;; if word in reserved words make it upper case

(define (to-upper-r-w word)
  (if (member? word reserved-words string=?) (string-upcase word) word))

;; print elelments of list in a new line
(define (print-list list)
  (for ([line list])
    (displayln line)))

(print-list lines)
