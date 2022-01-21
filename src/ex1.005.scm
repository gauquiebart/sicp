(load "./test-manager/load.scm")


(define (p) (p))

(define p (lambda () (p)))
;; we define to p to be a procedure with no arguments, that evaluates p 
;; so we have an endless recursive function, if applied

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;; with an interpreter that uses applicative order evaluation (evaluate the arguments and then apply)
;; 
;; (test 0 (p))
;; in order to evaluate the third subexpression of the combination, we evaluate the combination (application of procedure p without any arguments)
;; (test 0 (p))
;; (test 0 (p))
;; etc...

;; with an interpreter that uses normal order evaluation (fully expand and then reduce) (so we don't evaluate the arguments until their values are needed)
;; (if (= 0 0) 0 (p))
;; (if #t 0 (p))
;; 0

