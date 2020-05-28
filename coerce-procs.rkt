#lang racket

(require "table.rkt" "tag-system.rkt" "arithmetic-impl.rkt")

;; implementar aqui procedimentos de coerção

(define (rational->scheme-number x) ; ex-2.82
  (/ (numer x)
     (denom x)))

(put-coercion 'rational 'scheme-number rational->scheme-number) ; ex-2.82

