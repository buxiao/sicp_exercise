#lang planet neil/sicp

(define (pow a n)
  (if (= n 1)
      a
      (* a (pow a (- n 1)))))

(define (log a b)
  (if (= a b)
      1
      (+ 1 (log a (/ b a)))))

(define (cons a b)
  (* (pow 2 a) (pow 3 b)))

(define (car z)
  (if (= (remainder z 3) 0)
      (car (/ z 3))
      (log 2 z)))
      
(define (cdr z)
  (if (= (remainder z 2) 0)
      (cdr (/ z 2))
      (log 3 z)))

(car (cons 9 5))
(cdr (cons 9 5))