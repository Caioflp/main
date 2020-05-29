#lang racket

;; ex-2.83

(require "table.rkt" "tag-system.rkt")

;; interface with the system

(define (tag x) (attach-tag 'integer x))

(put 'add '(integer integer) +)

(put 'sub '(integer integer) -)

(put 'mul '(integer integer) *)

(put 'div '(integer integer) /)

(put 'make 'integer (lambda (x) (tag x)))
