#lang racket

(define (attach-tag type-tag contents)
  (cons type-tag contents)) ; ex-2.83

(define (type-tag datum) ; ex-2.83
	(if (pair? datum )
	    (car datum)
	    (error "Bad tagged datum: TYPE-TAG" datum)))

(define (contents datum)
	(if (pair? datum)
	    (cdr datum)
	    (error "Bad tagged datum: CONTENTS" datum)))


(provide attach-tag type-tag contents)
