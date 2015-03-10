#lang planet neil/sicp

;(1 3 (5 7) 9)
(define a (cons 5 7))
(define b (list 1 3 a 9))
(cdr (car (cdr (cdr b))))

;((7))
(define c (cons (cons 7 nil) nil))
(car (car c))

;(1 (2 (3 (4 (5 (6 7))))))
(define d (cons 1(cons 2 (cons 3 (cons 4 (cons 5 (cons 6 7)))))))
(cdr (cdr (cdr (cdr (cdr (cdr d))))))