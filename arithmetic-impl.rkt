#lang racket

(require "table.rkt" "tag-system.rkt" "real.rkt" "complex.rkt"
	 "rational.rkt" "integer.rkt")

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
(define (equ? x y) (apply-generic 'equ? x y))
(define (=zero? x) (apply-generic '=zero? x))

(define (my-add x y w z) ; ex-2.82
  (apply-generic 'my-add x y w z))

(define (make-from-real-imag x y)
   ((get 'make-from-real-imag 'complex) x y))
(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))
(define (make-rational x y)
   ((get 'make 'rational) x y))
(define (make-real-number x)
  ((get 'make 'real-number) x))
(define (make-integer x)
  ((get 'make 'integer) x)) ; ex-2.83

(define (numer x) (apply-generic 'numer x)) ; ex-2.82
(define (denom x) (apply-generic 'denom x)) ; ex-2.82

(provide add sub mul div equ? =zero? my-add make-from-real-imag make-from-mag-ang
	 make-rational make-real-number make-integer numer denom)

