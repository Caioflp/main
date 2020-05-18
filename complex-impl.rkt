#lang racket

;; provide the put and get
(require "table.rkt")

(require "utils.rkt")
(require "tag-system.rkt")

(require "complex-ben.rkt")
(require "complex-alyssa.rkt")

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z)     (apply-generic 'angle z))
(define (equ? z w) (apply-generic 'equ? z w))
(define (=zero? z) (apply-generic '=zero? z))

(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)
(put 'equ? '(complex complex) equ?)
(put '=zero? '(complex) =zero?)

(define (make-from-real-imag x y)
  ((get 'make-from-real-imag 'rectangular) x y))
(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))


(provide real-part imag-part magnitude angle
         make-from-real-imag make-from-mag-ang)

