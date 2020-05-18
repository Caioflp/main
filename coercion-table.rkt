#lang racket

(require "tag-system.rkt")
;; https://docs.racket-lang.org/guide/hash-tables.html

(define coercion-table (make-hash))

(define (start-coercion)
  (set! coercion-table (make-hash)))

(define (put-coercion type1 type2 proc-coercion)
  (if (hash-has-key? coercion-table type1)
      (hash-set! (hash-ref coercion-table type1) type2 proc-coercion)
      (hash-set! coercion-table type1 (make-hash (list (cons type2 proc-coercion))))))

(define (get-coercion type1 type2)
  (if (hash-has-key? coercion-table type1)
      (let ((tbo (hash-ref coercion-table type1)))
        (if (hash-has-key? tbo type2)
            (hash-ref tbo type2)
            false))
      false))

(define (show-coercion)
  coercion-table)

(provide put-coercion get-coercion show-coercion start-coercion)
