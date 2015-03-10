#lang planet neil/sicp

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (length lists)
  (if (null? lists)
      0
      (+ 1 (length (cdr lists)))))

(define (except-first-denomination lists)
  (cdr lists))

(define (first-denomination lists)
  (car lists))

(define (no-more? lists)
  (= (length lists) 0))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount (except-first-denomination coin-values))
                 (cc (- amount (first-denomination coin-values)) coin-values)))))

(cc 100 us-coins)
(cc 100 uk-coins)