#lang planet neil/sicp

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (fringe tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree))
                    (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))