(define (cont-frac n d x k)
	(define (f i result)
		(if (= i 1) 
				result
				(f (- i 1) (/ (n (- i 1) x) (+ (d (- i 1)) result)))))
	(f k x))

(define (N i x)
	(if (= i 1)
			x
			(* x x -1)))

(define (D i) (- (* 2 i) 1.0))			

(define (tan-cf x k) (cont-frac N D x k))

(define (print i)
	(newline)
	(display i))
	
;(print (tan-cf 10 10))
(print (tan-cf 10 30))
