(define (identity x) x)
(define (inc x) (+ 1 x))
(define (square x) (* x x))
(define (f x) (/ (* (* 2 x) (* 2 (+ x 1))) (square (+ (* 2 x) 1))))
(define (print x)
	(newline)
	(display x))
	
(define (product term a next b)
	(if (> a b)
			1
			(* (term a) (product term (next a) next b))))

(define (pi-calc term a next b)
	(if (> a b)
			1
			(* (term a) (product term (next a) next b))))

(define (pi-calc-iter term a next b)
	(define (iter a result)
		(if (> a b)
				result
				(iter (next a) (* result (term a)))))
	(iter a 1))
			
;(print (product identity 2 inc 10))
;(print (product identity 3 inc 9))
;(print (* 4.0 (pi-calc f 1 inc 10)))
(print (* 4.0 (pi-calc f 1 inc 100)))
(print (* 4.0 (pi-calc f 1 inc 1000)))
(print (* 4.0 (pi-calc-iter f 1 inc 10000)))
(print (* 4.0 (pi-calc-iter f 1 inc 100000)))