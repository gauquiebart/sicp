(load "./test-manager/load.scm")

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(define-test (a-plus-abs-b)
  (assert-= (a-plus-abs-b 1 2)
	    3)
  (assert-= (a-plus-abs-b 1 -2)
	    3)
  (assert-= (a-plus-abs-b -1 2)
	    1)
  (assert-= (a-plus-abs-b -1 -2)
	    1))

(run-registered-tests)

;; To evaluate an expression: 1. evaluate the subexpressions of the combination; 
;; then 2.  apply the procedure that is the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).

;; In the case of a-plus-abs-b, the first subexpression is an if statement, that gets evaluated; and dependening (so recursively apply the evaluation of this expression), on the input of b, a + or - operator appears.
;; this is then used to form either: (+ a b) or (- a b) 

;; e.g. (a-plus-a-b 1 2) 
;;      (+ 1 2)
;;      3

;;      (a-plus-a-b 1 -2)
;;      (- 1 -2) (which subtracts -2 from 1)
;;      3