#lang racket

(require "table.rkt" "tag-system.rkt" "arithmetic-impl.rkt")
(require rackunit)

;; implementar aqui procedimentos de coerção

(define (rational->real-number x) ; ex-2.82
  (make-real-number (/ (numer x)
		       (denom x))))

(put-coercion 'rational 'real-number rational->real-number) ; ex-2.82

(define (integer->rational x) ; ex-2.83
  (make-rational (contents x) 1))

(define (rational->real x) ; ex-2.83
  (make-real-number (/ (numer x)
		       (denom x))))

(define (real->complex x) ; ex-2.83
  (make-from-real-imag (contents x) 0))

(define (raise x) ; ex-2.83
  (let ((type (type-tag x)))
    (cond ((eq? type 'integer)
	   (integer->rational x))
	  ((eq? type 'rational)
	   (rational->real x))
	  ((eq? type 'real-number)
	   (real->complex x))
	  ((eq? type 'complex)
	   x)
	  (else "Error: Bad tagged datum:" x))))

(put-coercion 'any 'any raise) ; ex-2.83

;; testes

(check-equal? (raise (make-integer 3))
	      '(rational 3 . 1))
(check-equal? (raise (make-rational 3 1))
	      '(real-number . 3))
(check-equal? (raise (make-real-number 3))
	      '(complex rectangular 3 . 0))











