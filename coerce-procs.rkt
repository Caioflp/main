#lang racket

(require "table.rkt" "tag-system.rkt" "arithmetic-impl.rkt")

;; implementar aqui procedimentos de coerção

(define (rational->scheme-number x) ; ex-2.82
  (/ (numer x)
     (denom x)))

(put-coercion 'rational 'scheme-number rational->scheme-number) ; ex-2.82

(define (integer->rational x) ; ex-2.83
  (make-rational x 1))

(define (rational->real x) ; ex-2.83
  (/ (numer x)
     (denom x)))

(define (real->complex x) ; ex-2.83
  (make-from-real-imag x 0))
(real->complex 4)

(define (raise x) ; ex-2.83
  (let ((type (type-tag x)))
    (cond ((eq? type 'integer)
	   (integer->rational x))
	  ((eq? type 'rational)'
	   (rational->real x))
	  ((eq? type 'scheme-number)
	   (real->complex x))
	  ((eq? type 'complex)
	   x)
	  (else "Error: Bad tagged datum:" datum))))

(put-coercion 'any 'any raise) ; ex-2.83









