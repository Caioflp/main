#lang racket

(require "table.rkt" "tag-system.rkt" "general-arithmetic.rkt")

;; implementar aqui procedimentos de coerção

(define (rational->scheme-number x)
  (/ (numer x)
     (denom x)))

(put-coercion 'rational 'scheme-number rational->scheme-number)
