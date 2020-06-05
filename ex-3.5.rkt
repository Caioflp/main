#lang racket 

(require "utils.rkt")

(define (rand-update x)
  (modulo (+ (* 1838529 x) 3810384) 1928377))

(define rand (let ((x 1))
	       (lambda ()
		 (set! x (rand-update x))
		 x)))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* range (random)))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1)
		 (+ trials-passed 1)))
	  (else
	    (iter (- trials-remaining 1)
		  trials-passed))))
  (iter trials 0))

;; points are pairs of numbers

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (estimate-integral predicate x1 y1 x2 y2 trials)

  (define (experiment)
    (let ((point (make-point (random-in-range x1 x2)
			     (random-in-range y1 y2))))
      (predicate point)))

  (let ((area-rect (* (- x2 x1)
		      (- y2 y1))))
     (* (monte-carlo trials experiment)
	area-rect)))

;; teste

(define (circ-predicate point)
  (and (>= (- 2 (square (x-point point))) 0)
       (<= (y-point point)
	   (sqrt (- 2 (square (x-point point)))))))

(- pi (estimate-integral circ-predicate -2 0 2 2 10000000))
