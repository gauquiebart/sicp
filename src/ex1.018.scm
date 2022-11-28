(load "./test-manager/load.scm")

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (times-log a b)
  (times-log-iter a b 0))

(define (times-log-iter a b r)
  (cond ((= b 0) r)
	((even? b) (times-log-iter (double a) (halve b) r))
	(else (times-log-iter a (- b 1) (+ r a)))))

(define-test (expt)
  (assert-= (times-log 3 0)
	    0)
  (assert-= (times-log 3 1)
	  3)
  (assert-= (times-log 3 87)
	    261)
  (assert-= (times-log 17 19)
	    323)
  (assert-equal (even? 2)
		#t)
  (assert-equal (even? 3)
		#f)
  (assert-= (double 33)
	    66)
  (assert-= (halve 34)
	    17)
  (assert-= (halve 33)
	    16.5))

(run-registered-tests)

