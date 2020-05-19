#lang racket 

(require "table.rkt" "tag-system.rkt" "utils.rkt")

(define (tag x) (attach-tag 'racket-number x))

(put 'add '(racket-number racket-number)
     (lambda (x y) (tag (+ x y))))

;(put 'my-add '(racket-number racket-number racket-number racket-number)
;     (lambda (x y w z) (tag (+ x y w z))))

(put 'sub '(racket-number racket-number)
     (lambda (x y) (tag (- x y))))

(put 'mul '(racket-number racket-number)
     (lambda (x y) (tag (* x y))))

(put 'div '(racket-number racket-number)
     (lambda (x y) (tag (/ x y))))

(put 'exp '(racket-number racket-number)
     (lambda (x y) (tag (expt x y))))

(put 'make 'racket-number (lambda (x) (tag x)))

(put 'equ? '(racket-number racket-number) =) ;ex-2.79

(put '=zero? '(racket-number) (curry = 0)) ;ex-2.80


