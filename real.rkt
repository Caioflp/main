#lang racket

(require rackunit)
(require "table.rkt" "tag-system.rkt")

(define (=zero? x)
  (= x 0)) ; ex-2.79

(define (tag x) (attach-tag 'real-number x))

(put 'add '(real-number real-number) +)
(put 'sub '(real-number real-number) -)
(put 'mul '(real-number real-number) *)
(put 'div '(real-number real-number) /)
(put 'make 'real-number (lambda (x) (tag x)))
(put 'my-add '(real-number real-number real-number real-number) ; ex-2.82
     (lambda (x y w z) (+ x y w z)))
(put 'equ?   '(real-number real-number) =) ; ex-2.79
(put '=zero? '(real-number) =zero?) ; ex-2.80


;; test

(check-equal? (=zero? 10) ; ex-2.80
              false)
(check-equal? (=zero? 0) ; ex-2.79
              true)

