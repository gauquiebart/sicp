(load "./test-manager/load.scm")

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
	 (* 2 (f-recursive (- n 2)))
	 (* 3 (f-recursive (- n 3))))))

(define-test (f-recursive)
  (assert-= (f-recursive -1)
	    -1)
  (assert-= (f-recursive 0)
	    0)
  (assert-= (f-recursive 1)
	    1)
  (assert-= (f-recursive 2)
	    2)
  (assert-= (f-recursive 3)
	    4)
  (assert-= (f-recursive 4)
	    11)
  (assert-= (f-recursive 5)
	    25))

(define (f-iter n)
  (define (iterate result-nmin1 result-nmin2 result-nmin3 counter)
    (if (= counter 0)
	result-nmin3
	(iterate (+ result-nmin1
		    (* 2 result-nmin2)
		    (* 3 result-nmin3))
		 result-nmin1
		 result-nmin2
		 (- counter 1))))
  (iterate 2 1 0 n))


(define-test (f-iter)
  (assert-= (f-iter 0)
	    0)
  (assert-= (f-iter 1)
	    1)
  (assert-= (f-iter 2)
	    2)
  (assert-= (f-iter 3)
	    4)
  (assert-= (f-iter 4)
	    11)
  (assert-= (f-iter 5)
	    25))

	    
(run-registered-tests)

(f-recursive 10)
(f-iter 10)

(f-recursive 20)
(f-iter 20)

;;(f-recursive 1000)
;; does not compute ...

(f-iter 1000)

(f-iter 100000)

