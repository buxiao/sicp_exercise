#lang planet neil/sicp

(define (map1 proc seq)
  (if (null? seq)
      nil
      (cons (proc (car seq))
            (map1 proc (cdr seq)))))

(define (map2 proc seq1 seq2)
  (if (null? seq1)
      nil
      (cons (proc (car seq1) (car seq2))
            (map2 proc (cdr seq1) (cdr seq2)))))

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map1 car seqs))
            (accumulate-n op init (map1 cdr seqs)))))

(define v (list 2 2 2 2))
(define m (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))
(define n (list (list 1 0 0 0) (list 0 1 0 0) (list 0 0 1 0) (list 0 0 0 1)))

(define (dot-product v w)
  (accumulate + 0 (map2 * v w)))

(define (matrix-p-vector m v)
  (map1 (lambda (u) (dot-product v u)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-p-matrix m n)
  (let ((cols (transpose n)))
    (map1 (lambda (u) (matrix-p-vector cols u)) m)))

(transpose m)

(matrix-p-vector m v)

(matrix-p-matrix m n)