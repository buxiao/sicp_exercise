(define (fr n)
        (if (or (< n 3) (= n 3)) 
            n
            (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (fi n) 
  (define (f-iter a b c count)
     (cond ((= 1 n) 1)
     		   ((= 2 n) 2)
     		   ((= 3 n) 3)
     		   ((= count n) a)
     		   (else (f-iter (+ a (* 2 b) (* 3 c)) a b (+ 1 count)))))
  (f-iter 3 2 1 3))

    