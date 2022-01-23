(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 2)) (fib (- n 1))))))


(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 30)

(define (fib-iter n)
  (define (iterate a b counter)
    (if (= counter 0)
	b
	(iterate b (+ a b) (- counter 1))))
  (iterate 1 0 n))

(fib-iter 0)
(fib-iter 1)
(fib-iter 5)
(fib-iter 30)
(fib-iter 10000)

  

