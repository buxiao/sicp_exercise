#lang planet neil/sicp

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment s e) (cons s e))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
(define (mid-segment s)
  (make-point (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2.0)
              (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2.0)))

(define s (make-segment (make-point 1 2) (make-point 3 4)))

(print-point (start-segment s))
(print-point (end-segment s))
(print-point (mid-segment s))