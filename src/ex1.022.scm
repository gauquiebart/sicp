(define (smallest-divisor n) 
  (find-divisor n 2))

(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1))))) 

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time) 
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime prime elapsed-time)
  (newline)
  (display prime)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes from maxfound)
  (define (iter current nthfound)
    (if (< nthfound maxfound)
	(if (prime? current)
	    (begin
	      (timed-prime-test current)
	      (iter (+ current 2) (+ nthfound 1)))
	    (iter (+ current 2) nthfound))))
  (iter from 0))

(search-for-primes 10000000001 3)

;10000000019 *** .11000000000000298
;10000000033 *** .10999999999999943
;10000000061 *** .10999999999999943

(search-for-primes 100000000001 3)
;100000000003 *** .3500000000000014
;100000000019 *** .3399999999999963
;100000000057 *** .3999999999999986

(search-for-primes 1000000000001 3)
;1000000000039 *** 1.1000000000000014
;1000000000061 *** 1.1000000000000014
;1000000000063 *** 1.1000000000000014

(search-for-primes 10000000000001 3)
;10000000000037 *** 3.5
;10000000000051 *** 3.480000000000004
;10000000000099 *** 3.489999999999995

(* .11 (sqrt 10))
;Value: .3478505426185218 

(* .35 (sqrt 10))
;Value: 1.1067971810589328

(* 1.1 (sqrt 10))
;Value: 3.478505426185218

;This prime? procedure clearly scales according to the prediction of theta(sqrt 10). 
;Programs on my machine run in time proportional to the number of steps required for the computation.



  

