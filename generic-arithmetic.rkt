#lang racket

(require "coerce-procs.rkt" "arithmetic-impl.rkt")
(require rackunit)

; testes

; (check-equal? (add 1 2) 3)

(check-equal? (mul (make-rational 1 2)
                   (make-rational 1 4))
              (make-rational 1 8))

(check-equal? (sub (make-from-real-imag 3 4)
                   (make-from-real-imag 5 4))
              (make-from-real-imag -2 0))

(check-equal? (add (make-from-real-imag 3 -5)
                   (make-from-real-imag 1 6))
              (make-from-real-imag 4 1))

(check-equal? (equ? (make-from-real-imag 3 -5) ; ex-2.79
                    (make-from-real-imag 1 6))
              #f)

(check-equal? (equ? (make-rational 3 5) ; ex-2.79
                    (make-rational 1 6))
              #f)

(check-equal? (equ? (make-rational 3 5) ; ex-2.79
                    (make-rational 6 10))
              #t)

(check-equal? (equ? 2 6) #f) ; ex-2.79
(check-equal? (=zero? 0) #t) ; ex-2.79
(check-equal? (=zero? (make-from-real-imag 3 -5)) #f) ; ex-2.80
(check-equal? (=zero? (make-rational 3 5)) #f) ; ex-2.80

(my-add 1 2 (make-rational 6 2) 4) ; ex-2.82
