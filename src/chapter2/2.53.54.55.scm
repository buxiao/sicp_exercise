#lang planet neil/sicp

(car ''abracadabra)
(car '(a b c))
(list 'a 'b 'c)
(list (list 'george))
(cdr '((x1 x2) (y1 y2)))
(cadr '((x1 x2) (y1 y2)))
(pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))

(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) true)
        ((or (null? list1) (null? list2)) false)
        ((not (eq? (car list1) (car list2))) false)
        (else (equal? (cdr list1) (cdr list2)))))

(equal? '(this is a list) '(this (is a) list))