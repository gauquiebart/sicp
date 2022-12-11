(define (smallest-divisor n) 
  (find-divisor n 3))

(define (next divisor)
  (if (= divisor 2) 3
      (+ divisor 2)))

(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
	(else (find-divisor n 
			    (+ test-divisor 2))))); next inlined ...  + remove test

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


;timings for original prime
(search-for-primes 10000000001 3)
;10000000019 *** .2699999999999996
;10000000033 *** .28000000000000114
;10000000061 *** .2799999999999976

(search-for-primes 100000000001 3)
;100000000003 *** .879999999999999
;100000000019 *** .870000000000001
;100000000057 *** .9200000000000017

;timings for prime with reduced testing
(search-for-primes 10000000001 3)
;10000000019 *** .17999999999999972
;10000000033 *** .17999999999999972
;10000000061 *** .17999999999999972

(search-for-primes 100000000001 3)
;100000000003 *** .5600000000000023
;100000000019 *** .5499999999999972
;B100000000057 *** .5599999999999952

; it seems faster, but not 100pct
; Maybe related to extra procedure calls that are necessary? And the predicate test that is necessary.

; if you inline next function, it is a bit faster, but not twice as fast ... 
; if you also remove the predicate check (and also make sure it is plus 2), we get:
;10000000019 *** .14000000000000057
;10000000033 *** .14000000000000057
;10000000061 *** .13999999999998636
;and
;100000000003 *** .4399999999999977
;100000000019 *** .4399999999999977
;100000000057 *** .44000000000001194


;now we get a 100pct increase ... 


