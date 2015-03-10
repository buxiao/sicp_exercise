#lang planet neil/sicp

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (compose-iter g k)
    (if (= k n)
        g
        (compose-iter (compose g f) (+ k 1))))
  (compose-iter f 1))

((repeated square 2) 5)