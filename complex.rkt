#lang racket

(require "complex-impl.rkt" "table.rkt" "tag-system.rkt")

(define (add-complex z1 z2)
  (make-from-real-imag (+ (real-part z1) (real-part z2))
                       (+ (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
  (make-from-real-imag (- (real-part z1) (real-part z2))
                       (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                     (+ (angle z1) (angle z2))))

(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                     (- (angle z1) (angle z2))))


(define (tag z) (attach-tag 'complex z))

(put 'add '(complex complex)
     (lambda (z1 z2) (tag (add-complex z1 z2))))

(put 'sub '(complex complex)
     (lambda (z1 z2) (tag (sub-complex z1 z2))))

(put 'mul '(complex complex)
     (lambda (z1 z2) (tag (mul-complex z1 z2))))

(put 'div '(complex complex)
     (lambda (z1 z2) (tag (div-complex z1 z2))))

(put 'make-from-real-imag 'complex
     (lambda (x y) (tag (make-from-real-imag x y))))

(put 'make-from-mag-ang 'complex
     (lambda (r a) (tag (make-from-mag-ang r a))))

