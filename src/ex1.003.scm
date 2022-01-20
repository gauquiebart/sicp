(load "./test-manager/load.scm")

(define square 
  (lambda (x)
    (* x x)))

(define largest max)
(define smallest min)

(define second-largest
  (lambda (x y z)
    (smallest (largest x y)
	      (largest y z)
	      (largest x z))))
 
(define sum-of-squares-of-two-largest 
  (lambda (x y z)
    (+ (square (largest x y z))
       (square (second-largest x y z)))))

(define-test (sum-of-squares-of-two-largest)
  (assert-= (sum-of-squares-of-two-largest 3 5 9)
	    106)
  (assert-= (sum-of-squares-of-two-largest 5 9 3)
	    106)
  (assert-= (sum-of-squares-of-two-largest 9 3 5)
	    106))

(run-registered-tests)
