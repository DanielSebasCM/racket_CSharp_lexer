#lang racket

(require racket/list)

(define my-list '(apple banana cherry))
(number? (index-of my-list 'banana)) ; returns #t
