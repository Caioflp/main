#lang racket

(require "table.rkt" "arithmetic-impl.rkt" "tag-system.rkt")

(define (racket-number->complex x)
  (make-complex-from-real-imag (contents x) 0))

(define (rational->racket-number x)
  (/ (numer x)
     (denom x)))

(put-coercion 'racket-number 'complex racket-number->complex)
(put-coercion 'rational 'racket-number rational->racket-number)
