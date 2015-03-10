(define (cuberoot x)
	(define (cube x) (* x x x))
	(define (good-enough? guess) (< (abs (- (cube guess) x)) 0.0001))
	(define (improve guess)
		(/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
	(define (cr-iter guess)
		(if (good-enough? guess)
			guess
			(cr-iter (improve guess))))
	(cr-iter 1.0))
		