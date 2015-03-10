(define (cont-frac n d k)
	(define (f i result)
		(cond ((= i 1) result)
					(else (f (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) result))))))
	(f k (/ (n k) (d k))))
	
(cont-frac (lambda (y) 1.0) (lambda (y) 1.0) 10)