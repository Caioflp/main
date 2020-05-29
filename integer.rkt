#lang racket

;; ex-2.83

(require "table.rkt")

;; interface with the system

(put 'add '(integer integer) +)

(put 'sub '(integer integer) -)

(put 'mul '(integer integer) *)

(put 'div '(integer integer) /)

