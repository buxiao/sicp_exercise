#lang planet neil/sicp

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (total-weight mobile)
  (let ((ls (branch-structure (left-branch mobile)))
        (rs (branch-structure (right-branch mobile))))
    (if (pair? ls)
        (if (pair? rs)
            (+ (total-weight ls)
               (total-weight rs))
            (+ (total-weight ls)
               rs))
        (if (pair? rs)
            (+ ls
               (total-weight rs))
            (+ ls
               rs)))))

(define (branch-weight branch)
  (let ((s (branch-structure branch)))
    (if (pair? s)
        (total-weight s)
        s)))

(define (branch-torque branch)
  (* (branch-weight branch)
     (branch-length branch)))

(define (branch-balanced? branch)
  (let ((s (branch-structure branch)))
    (if (pair? s)
        (balanced? s)
        true)))

(define (balanced? mobile)
  (let ((lb (left-branch mobile))
        (rb (right-branch mobile)))
    (and (= (branch-torque lb) (branch-torque rb))
         (branch-balanced? lb)
         (branch-balanced? rb))))

(define level-1-mobile (make-mobile (make-branch 2 1) 
                                    (make-branch 1 2))) 
(define level-2-mobile (make-mobile (make-branch 3 level-1-mobile) 
                                    (make-branch 9 1))) 
(define level-3-mobile (make-mobile (make-branch 4 level-2-mobile) 
                                    (make-branch 8 2))) 

(total-weight level-1-mobile) 
(total-weight level-2-mobile) 
(total-weight level-3-mobile) 

(balanced? level-1-mobile)
(balanced? level-2-mobile)
(balanced? level-3-mobile)