	
(define (cont-frac n d k)
	(define (f i result)
		(cond ((= i 1) result)
					(else (f (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) result))))))
	(f k (/ (n k) (d k))))

(define (D i)
	(cond ((= i 2) 2.0)
				((= (remainder (- i 5) 3) 0) (* 2.0 (/ (+ i 1) 3)))
				(else 1.0)))	

(define (print i)
	(newline)
	(display i))

(print (+ 2 (cont-frac (lambda (y) 1.0) D 100)))