(load "./test-manager/load.scm")

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
		      x)))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess))
	(* 2 guess))
     3))

(define-test (cube-roots-using-newtons-method)
  (assert-= (cube-root 100)
	    4.641590111046459)
  (assert-= (cube-root 27)
	    3.0000005410641766))

(run-registered-tests)