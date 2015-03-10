(define tolerance 0.00001)
(define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
	
(define (fixed-point f first-guess)
	(define (try guess count)
		(newline)
		(display "try ")
		(display count)
		(display ":")
		(display guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
					next
					(try next (+ 1 count)))))
	(try first-guess 0))
	
(fixed-point (lambda (y) (/ (+ y (/ (log 1000) (log y))) 2)) 2.0)