#lang sicp

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))

;; return 3

(define lst1 (cons 1 (cons 2 (cons 3 nil))))
(count-pairs lst1)
lst1

;; return 4

(define x (cons 3 4))
(define lst2 (cons x (cons x nil)))
(count-pairs lst2)
lst2

;; return 7
(define w (cons 3 nil))
(define y (cons w w))
(define lst3 (cons y y))
(count-pairs lst3)
lst3

