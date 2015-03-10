(define tolerance 0.00001)
(define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
	
(define (fixed-point f first-guess)
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
					next
					(try next))))
	(try first-guess))
	
(newline)
(fixed-point (lambda (y) (+ 1 (/ 1.0 y))) 1.0)