#lang sicp

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define lst '(1 2 3))
(define lst2 '(1 2 3))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
z
