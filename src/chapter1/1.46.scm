#lang planet neil/sicp

(define tolerance 0.0001)
(define (good-enough? a b)
  (< (/ (abs (- a b)) a) tolerance))

(define (iterative good-enough? improve)
  (lambda (guess)
    (let ((next (improve guess)))
    (if (good-enough? guess next)
        next
        ((iterative good-enough? improve) next)))))

(define (sqrt x)
  ((iterative good-enough? (lambda (y) (/ (+ (/ x y) y) 2.0))) 1.0))

(sqrt 200)