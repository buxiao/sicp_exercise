(define (sum term a next b)
	(if (> a b)
			0
			(+ (term a) (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (cube a) (* a a a))
(define (even? n) (and (> n 0) (= 0 (remainder n 2))))

(define (integral f a b dx)
	(define (add-dx x) (+ x dx))
	(* dx (sum f (+ a (/ dx 2.0)) add-dx b)))

(newline)	
(display (integral cube 0 1 0.01))
(newline)
(display (integral cube 0 1 0.001))

(define (integral-sr f a b n)
	(define (sum-sr term k next n)
		(define (get-value-2) (+ a (* (- (* 2 k) 2) (/ (- b a) n))))
		(define (get-value-1) (+ a (* (- (* 2 k) 1) (/ (- b a) n))))
		(define (get-value) (+ a (* (* 2 k) (/ (- b a) n))))
		(if (> k (/ n 2)) 
				0
				(+ (term (get-value-2)) (* 4 (term (get-value-1))) (term (get-value)) (sum-sr term (next k) next n))))
	(* (/ (- b a) (* 3.0 n)) (sum-sr f 0 inc n)))
	
(newline)	
(display (integral-sr cube 0 1 100))
(newline)
(display (integral-sr cube 0 1 1000))