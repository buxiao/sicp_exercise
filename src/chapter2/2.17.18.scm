#lang planet neil/sicp

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair items)
  (list-ref items (- (length items) 1)))

(define (reverse items)
  (define (reverse-iter lists n)
    (if (= n 0) 
        (cons (list-ref lists 0) nil)
        (cons (list-ref lists n) (reverse-iter lists (- n 1)))))
  (if (null? items)
      items
      (reverse-iter items (- (length items) 1))))

(last-pair (list 23 72 149 34))
(reverse (list 1 4 9 16 25))
