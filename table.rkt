#lang racket

(require racket/trace)
(require "tag-system.rkt")
;; https://docs.racket-lang.org/guide/hash-tables.html

;-------------------------operations and types table---------------------------
(define table (make-hash))

(define (start)
  (set! table (make-hash)))

(define (put op type item)
  (if (hash-has-key? table op)
      (hash-set! (hash-ref table op) type item)
      (hash-set! table op (make-hash (list (cons type item))))))

(define (get op type)
  (if (hash-has-key? table op)
      (let ((tbo (hash-ref table op)))
        (if (hash-has-key? tbo type)
            (hash-ref tbo type)
            false))
      false))

(define (show)
  table)

;-----------------------------coercion table-----------------------------------

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

;------------------------------apply-generic------------------------------------
;------------------------apply-generic (for two arguments)----------------------

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (if (= (length args) 2)
	      (let ((type1 (car type-tags))
		    (type2 (cadr type-tags))
		    (a1 (car args))
		    (a2 (cadr args)))
		(if (eq? type1 type2)	;<if> statement added in ex-2.81
		    (error "No method for these types"
			   (list op type-tags))
		    (let ((t1->t2 (get-coercion type1 type2))
			  (t2->t1 (get-coercion type2 type1)))
		      (cond (t1->t2
			      (apply-generic op (t1->t2 a1) a2))
			    (t2->t1
			      (apply-generic op a1 (t2->t1 a2)))
			    (else (error "No method for these types"
					 (list op type-tags)))))))
	      (error "No method for these types"
		     (list op type-tags)))))))

;----------------------apply-generic (for multiple arguments)-------------------

;(define (apply-generic op . args)
;  (let ((type-tags (map type-tag args)))
;    (let ((proc (get op type-tags)))
;      (if proc
;	  (apply proc (map contents args))
;	  (let ((type1 (car type-tags))
;		(other-types (cdr type-tags))
;		(arg1 (car args))
;		(other-args (cdr args)))
;	    (define (apply-generic-aux count)
;	      (let ((num-args (length args)))
;		(if (> (+ 1 count) num-args)
;		    (error "No method for these types"
;			   (list op type-tags))
;		    (let ((type-ref (list-ref type-tags count)))
;		      (let ((type-coerce (map (lambda (type)
;					       (if (eq? type type-ref)
;						   (lambda (x) x)
;						   (get-coercion type type-ref)))
;					     type-tags)))
;		       (if (foldl (lambda (x y) (and x y)) true type-coerce)
;			   (apply apply-generic (cons op (foldl (lambda (coerce arg inital)
;								  (cons (coerce arg) inital))
;								null
;								type-coerce
;								args)))
;			   (apply-generic-aux (add1 count))))))))
;	    (if (andmap (lambda (a) (eq? a type1)) other-types)
;		(error "No method for these types"
;		       (list op type-tags))
;		       (apply-generic-aux 0)))))))

(provide put get show start apply-generic)
(provide put-coercion get-coercion show-coercion start-coercion)
