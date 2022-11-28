(load "./test-manager/load.scm")

;Solving for Tpq 

;Tpq

;a' = bq + aq + ap  (1)
;b' = bp + aq       (2)

; apply Tpq again gives:

;a" = b'q + a'q + a'p  (3)
;b" = b'p + a'q        (4)

; Filling in (1), (2) in (3) gives:

;a" = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;a" = bpq + aqq + bqq + aqq + apg + bqp + apq + app
;a" = b(2pq + qq) + a(2pq + qq) + a(qq + pp)
;p' = qq + pp       (5)
;q' = 2pq + qq      (6)

; Verifying by filling in (1), (2) in (4)
;b" = (bp + aq)p + (bq + aq + ap)q
;b" = bpp + aqp + bqp + aqq + apq
;b" = b(qq + pp) + a(2pq + qq)
; so same result

(define (even? n)
  (= (remainder n 2) 0))

(define (fib n) 
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count) 
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
		   b
		   (+ (* q q) (* p p))
		   (+ (* 2 p q) (* q q))
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p)) 
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))

(define-test (fibs)
  (assert-= (fib 0)
	    0)
  (assert-= (fib 1)
	    1)
  (assert-= (fib 2)
	    1)
  (assert-= (fib 3)
	    2)
  (assert-= (fib 4)
	    3)
  (assert-= (fib 5)
	    5)
  (assert-= (fib 6)
	    8)
  (assert-= (fib 7)
	    13)
  (assert-= (fib 8)
	    21)
  (assert-= (fib 9)
	    34)
  (assert-= (fib 10)
	    55))

(run-registered-tests)