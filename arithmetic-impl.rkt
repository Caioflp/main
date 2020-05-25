#lang racket

(require "table.rkt" "tag-system.rkt" "complex.rkt"
	 "rational.rkt" "ordinary.rkt")

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
(define (exp x y) (apply-generic 'my-exp x y))
(define (equ? x y) (apply-generic 'equ? x y))
(define (=zero? x) (apply-generic '=zero? x)) 

(define (numer x) (apply-generic 'numer x))
(define (denom x) (apply-generic 'denom x))
(define (my-add x y w z) (apply-generic 'my-add x y w z))

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))

(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))

(define (make-rational n d)
  ((get 'make 'rational) n d))

(define (make-racket-number n)
  ((get 'make 'racket-number) n))

(provide make-rational
	 make-complex-from-real-imag
	 make-complex-from-mag-ang
	 numer
	 denom
	 my-add
	 add
	 sub
	 mul
	 div
	 exp
	 equ?
	 =zero?
	 make-racket-number)

