#lang planet neil/sicp

(define (>= x y)
  (or (> x y) (= x y)))

(define (<= x y)
  (or (< x y) (= x y)))

(define (make-interval a b)
  (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (interval-sign-pp? x)
  (and (>= (lower-bound x) 0) (>= (upper-bound x) 0) ))

(define (interval-sign-nn? x)
  (and (<= (lower-bound x) 0) (<= (upper-bound x) 0)))

(define (interval-sign-np? x)
  (and (<= (lower-bound x) 0) (>= (upper-bound x) 0)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (cond ((and (interval-sign-nn? x) (interval-sign-nn? y))
         (make-interval (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
        ((and (interval-sign-nn? x) (interval-sign-np? y))
         (make-interval (* (lower-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
        ((and (interval-sign-nn? x) (interval-sign-pp? y))
         (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y))))
        ((and (interval-sign-np? x) (interval-sign-nn? y))
         (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (lower-bound y))))
        ((and (interval-sign-np? x) (interval-sign-np? y))
         (make-interval (min (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y)))
                        (max (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y)))))
        ((and (interval-sign-np? x) (interval-sign-pp? y))
         (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (upper-bound y))))
        ((and (interval-sign-pp? x) (interval-sign-nn? y))
         (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (upper-bound y))))
        ((and (interval-sign-pp? x) (interval-sign-np? y))
         (make-interval (* (upper-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))
        ((and (interval-sign-pp? x) (interval-sign-pp? y))
         (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y)) 
                               (/ 1.0 (lower-bound y)))))

(define (div-interval-with-error-warning x y)
  (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
      (display "Error interval contains 0")
      (div-interval x y)))
