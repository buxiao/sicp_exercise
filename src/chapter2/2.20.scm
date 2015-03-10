#lang planet neil/sicp

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (same-parity first . rest) 
  (define (same-parity-iter source dist remainder-val) 
    (if (null? source) 
        dist 
        (same-parity-iter (cdr source) 
                          (if (= (remainder (car source) 2) remainder-val) 
                              (append dist (list (car source))) 
                              dist) 
                          remainder-val))) 
  (same-parity-iter rest (list first) (remainder first 2)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7 8)
