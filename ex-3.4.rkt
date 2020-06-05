#lang racket

(define (make-account balance password)
  (define trials 0)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops j)
    '(chamando a polícia))
  (define (dispatch given-password m)
    (cond ((not (eq? password given-password)) 
	   (begin (set! trials (+ 1 trials))
		  (if (= trials 7)
		      call-the-cops
		      (error "Incorrect password"))))
	  ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Unknown request: MAKE-ACCOUNT"
		       m))))
  dispatch)

