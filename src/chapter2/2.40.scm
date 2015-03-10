#lang planet neil/sicp

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n x)
  (cond ((> (square x) n) n)
        ((= (remainder n x) 0) x)
        (else (find-divisor n (+ x 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1) list2))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))


(define (filter-sum predicate sum sequence)
  (cond ((null? sequence) nil)
        ((predicate sum (car sequence))
         (cons (car sequence) (filter-sum predicate sum (cdr sequence))))
        (else (filter-sum predicate sum (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (cons i j))
             (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (make-pair-sum pair)
  (list (car pair) (cdr pair) (+ (car pair) (cdr pair))))

(define (make-triple-sum triple)
  (list (car triple) (car (cdr triple)) (cdr (cdr triple))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cdr pair))))

(define (equal-sum? s triple)
  (= s (+ (car triple) (car (cdr triple)) (car (cdr (cdr triple))))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(define (sum-triples n s)
  (map make-triple-sum
       (filter-sum equal-sum? s (unique-triples n))))
;(unique-pairs 6)
;(unique-triples 6)
;(filter prime-sum? (unique-pairs 6))
(sum-triples 6 10)
