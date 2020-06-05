#lang racket

(define f
  (let ((constant 1))
    (lambda (x)
      (set! constant (* x constant))
      constant)))

;; teste

;; da esquerda para a direita
(f 0)
(f 1)

;; da direita para a esquerda
;(f 1)
;(f 0)
