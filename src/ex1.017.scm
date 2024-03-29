(load "./test-manager/load.scm")

(define (times a b)
  (if (= b 0)
      0
      (+ a (times a (- b 1)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (times-log a b)
  (cond ((= b 0) 0)
	((even? b) (double (times-log a (halve b))))
	(else (+ a (times-log a (- b 1))))))

(define-test (expt)
  (assert-= (times 3 87)
	    261)
  (assert-= (times-log 3 87)
	    261)
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