#lang racket

(define (attach-tag type-tag contents)
  (cond ((eq? type-tag 'scheme-number) contents) ; ex-2.78
	((eq? type-tag 'integer) contents) ; ex-2.83
	(else (cons type-tag contents))))

(define (type-tag datum)
  (cond ((integer? datum) ; ex-2.83 TODO : consertar bug com apply-generic
	 'integer)
	((real? datum) ; ex-2.78
	 'scheme-number)
	((pair? datum)
	 (car datum))
	(else (error "Bad tagged datum: TYPE-TAG" datum))))

(define (contents datum)
  (cond ((real? datum) ; ex-2.78
	 datum)
	((integer? datum) ; ex-2.83
	 datum)
	((pair? datum)
	 (cdr datum))
	(else (error "Bad tagged datum: CONTENTS" datum))))


(provide attach-tag type-tag contents)
