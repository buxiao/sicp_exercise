#lang planet neil/sicp

(define tolerance 0.0001)

(define (good-enough? v1 v2)
  (< (/ (abs (- v1 v2)) v1) tolerance))

(define (average x y)
  (/ (+ x y) 2.0))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (define (iter g k)
    (if (= k 1)
        g
        (iter (compose g f) (- k 1))))
  (iter f n))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x y y y y))) 1.0)) 

(root 32)