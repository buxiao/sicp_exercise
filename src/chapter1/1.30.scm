(define (identity x) x)
(define (inc x) (+ 1 x))

(define (sum term a next b)
	(if (> a b)
			0
			(+ (term a) (sum term (next a) next b))))

(define (sum-iter term a next b)
	(define (iter a result)
		(if (> a b)
				result
				(iter (next a) (+ result (term a)))))
	(iter a 0))
	
;(newline)
;(display (sum identity 1 inc 10))
(newline)
(display (sum-iter identity 2 inc 10))
