#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
	y
	(let ((temp (cdr x)))
	  (set-cdr! x y)
	  (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd 'e 'f 'g))
(mystery v)
v

;(define (teste x)
;  (define (teste2 y)
;    (set-cdr! y '(3))
;    y)
;  (teste2 x))
;
;(define x '(1 2 3))
;(teste x)
;x
