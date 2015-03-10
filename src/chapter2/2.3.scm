#lang planet neil/sicp

(define tolerance 0.00001)

(define (square x)
  (* x x))

(define (average x y) 
  (/ (+ x y) 2.0))

(define (improve guess x) 
  (average (/ x guess) guess))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) tolerance))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x) (sqrt-iter 1.0 x))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (segment-length s)
  (sqrt (+ (square (- (x-point (start-segment s)) (x-point (end-segment s))))
           (square (- (y-point (start-segment s)) (y-point (end-segment s)))))))

(define (make-rect s1 s2)
  (cons s1 s2))

(define (rect-length r)
  (segment-length (car r)))

(define (rect-width r)
  (segment-length (cdr r)))

(define (rect-peri r)
  (* (+ (rect-length r) (rect-width r)) 2))

(define (rect-area r)
  (* (rect-length r) (rect-width r)))

(define p1 (make-point 1 1))
(define p2 (make-point 1 3))
(define p3 (make-point 4 1))
(define s1 (make-segment p1 p2))
(define s2 (make-segment p1 p3))
(define r (make-rect s1 s2))
(rect-peri r)
(rect-area r)