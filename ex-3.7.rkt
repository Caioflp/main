#lang racket

(define (make-account password balance)

  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch m given-password)
    (if (eq? given-password password)
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      (else (error "Unknown request: MAKE-ACCOUNT"
			   m)))
	false))

  dispatch)

(define (make-joint account current-password new-password)

  (define (new-dispatch m given-password)
    (if (or (eq? given-password current-password)
	    (eq? given-password new-password))
	(account m current-password)
	false))

  (if (account 'deposit current-password)
      new-dispatch
      (error "Incorrect Password for account")))

;; teste

(define acc (make-account 'senha 100))
(define acc2 (make-joint acc 'senha 'nova-senha))

((acc 'deposit 'senha) 50)
((acc2 'withdraw 'nova-senha) 25)


