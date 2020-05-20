#lang racket

(require "utils.rkt")

(define (apply-generic op arg) (arg op))

(define (make-from-mag-ang mag ang)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) mag)
	  ((eq? op 'angle) ang)
	  ((eq? op 'real-part) (* mag (cos ang)))
	  ((eq? op 'imag-part) (* mag (sin ang)))
	  (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) x)
	  ((eq? op 'imag-part) y)
	  ((eq? op 'magnitude) (sqrt (+ (square x) (square y))))
	  ((eq? op 'angle) (atan y x))
	  (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define (real-part z)
  (apply-generic 'real-part z))
(define (imag-part z)
  (apply-generic 'imag-part z))
(define (magnitude z)
  (apply-generic 'magnitude z))
(define (angle z)
  (apply-generic 'angle z))

(provide make-from-real-imag make-from-mag-ang 
	 real-part imag-part magnitude angle)

;teste

;(define z (make-from-mag-ang 1 (/ pi 3)))
;(real-part z)

