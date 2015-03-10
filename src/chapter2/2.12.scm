#lang planet neil/sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p)))

(define (percent interval)
  (/ (- (upper-bound interval) (lower-bound interval))
     (+ (upper-bound interval) (lower-bound interval))))