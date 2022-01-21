(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 10000)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

;; the reason this new-if works for previous examples, than the applicative order evaluation rule is applied. So the predicate, then-clause, else-clause are evaluated, and then substituted into the body, giving:
;; (new-if (= 2 3) 0 5)
;; (new-if #f 0 5)
;; (cond (#f 0)
;;       (else 5))
;; 5

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

(sqrt 10000)

;; However, if you do the same in which the then-clause or the else-clause also call the procedure itself (meaning a recursive definition of the procedure), you kinda break the stop condition of the procedure
;; Since this always keep on evaluating the third subexpression of the sqrt-iter procedure.

;; So we need a special form for the if which first evaluates the predicate, and if that is #t, evaluates the consequent (and not the alternative); 
;; and if the predicate evaluates to #f, evaluates the alternative (and not the consequent).

;; applying this gives us: 
;; ;Aborting!: maximum recursion depth exceeded 

;; for the same reasons, cond needs to be a special form, which will be evaluated differently than the default rules for evaluating a combination in applicative order.

