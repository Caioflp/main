#lang racket

(require "table.rkt" "tag-system.rkt")

;; internal procedures
(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
	    (* (denom x) (numer y))))

(define (equ? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (=zero? x)
  (= (numer x) 0))

;; interface to rest of the system

(define (tag x) (attach-tag 'rational x))
(put 'numer '(rational) numer)
(put 'denom '(rational) denom)
(put 'add '(rational rational)
     (lambda (x y) (tag (add-rat x y))))

(put 'sub '(rational rational)
     (lambda (x y) (tag (sub-rat x y))))

(put 'mul '(rational rational)
     (lambda (x y) (tag (mul-rat x y))))

(put 'div '(rational rational)
     (lambda (x y) (tag (div-rat x y))))

(put 'equ? '(rational rational) equ?) ;ex-2.79

(put '=zero? '(rational) =zero?) ;ex-2.80

(put 'make 'rational
     (lambda (n d) (tag (make-rat n d))))

