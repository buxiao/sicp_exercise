#lang planet neil/sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) 
  (* x x))

(define (inc x)
  (+ x 1))

((compose inc square) 6)