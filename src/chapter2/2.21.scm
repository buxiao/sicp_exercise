#lang planet neil/sicp

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list-1 items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
            (square-list-1 (cdr items)))))

(define (square-list-2 items)
  (map (lambda (x) (* x x)) items))

(define (square-list-3 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (* (car things) (car things))))))
  (iter items nil))

(square-list-1 (list 1 3 5 7 9))
(square-list-3 (list 1 3 5 7 9))
