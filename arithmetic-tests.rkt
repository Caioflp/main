#lang racket

(require "arithmetic-impl.rkt" "coercion-procs.rkt")

(my-add (make-rational 1 1)
	(make-rational 1 1)
	1
	(make-rational 1 1))
;constructors:
;make-complex-from-real-imag
;make-complex-from-mag-ang
;make-racket-number
;make-rational

;(make-complex-from-real-imag 3 4)
(equ? (make-rational 2 4) 
      (make-rational 3 6))
(=zero? 0)
(define a (make-complex-from-real-imag 1 2))
(define b (make-complex-from-real-imag 2 -3))
(add a b)

(define c (make-racket-number 3))
(define d (make-racket-number 4))
(mul c d)

(define e (make-rational 3 4))
(define f (make-rational 1 2))
(div e f)
