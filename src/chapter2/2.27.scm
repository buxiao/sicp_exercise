#lang planet neil/sicp

(define (list-ref items index)
  (define (iter-loop lists k)
    (if (= k index)
        (car lists)
        (iter-loop (cdr lists) (+ k 1))))
  (iter-loop items 0))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (deep-reverse items)
  (define (iter lists k)
    (if (or (= k 0) (> k 0))
        (if (pair? (list-ref lists k))
            (cons (deep-reverse (list-ref lists k)) (iter lists (- k 1)))
            (cons (list-ref lists k) (iter lists (- k 1))))
        nil))
  (iter items (- (length items) 1)))
            
(define x (list (list 1 2) (list 3 4)))
(length x)
(deep-reverse x)