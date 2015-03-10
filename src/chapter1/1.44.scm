#lang planet neil/sicp

(define dx 0.0001)

(define (average a b c)
  (/ (+ a b c) 3.0))

(define (square x)
  (* x x))

(define (smooth f)
  (lambda (x)
    (average (f x) (f (- x dx)) (f (+ x dx)))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (compose-iter g k)
    (if (= k n)
        g
        (compose-iter (compose g f) (+ k 1))))
  (compose-iter f 1))

(define (smooth-n f n)
  (repeated (smooth f) n))

((smooth square) 2)
((smooth-n square 2) 2)
  