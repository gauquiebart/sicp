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
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;; For small numbers, the good-enough? comparison of 0.001 might be very close to the actual number or square.

(sqrt 0.2)
;Value: .44761904761904764
;Actual Value: 0,447213595499958

(sqrt 0.02)
;Value: .1444238094866232
;Actual Value: 0,14142135623731

(sqrt 0.002)
;Value: 5.0131352980478244e-2
;Actual Value: 0,044721359549996

(sqrt 0.0002)
;Value: .03335281609280434
;Actual value: 0,014142135623731

;=> as we can see, the smaller we get, the more significant numbers are wrong.

;; For large numbers, you might not have enough significant numbers to, when squaring have a result that can be within the margin specified. So if unlucky, the procedure might ping pong and not complete.

(sqrt 2000000000000000000)
;Value: 1414213562.373095
;Up to quite high numbers, it works fine.

;If you go even high, I get no result...
; (sqrt 200000000000000000000)
; fails


(define (sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess x)
		 guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x x))

(sqrt 0.2)
;Value: .4472137791286728
;Actual Value: 0,447213595499958

(sqrt 0.02)
;Value: .14142135968022695
;Actual Value: 0,14142135623731

(sqrt 0.002)
;Value: .04472230608683239
;Actual Value: 0,044721359549996

(sqrt 0.0002)
;Value: 1.4162413320389438e-2
;Actual value: 0,014142135623731

;; so for smaller numbers, better results

(sqrt 2000000000000000000)
;Value: 1414213562.373095
;Up to quite high numbers, it works fine.

(sqrt 200000000000000000000)
;Value: 14142135623.73095

(sqrt 20000000000000000000000)
;Value: 141421356237.3095

(sqrt 2000000000000000000000000)
;Value: 1414213562373.0952

;; so for larger numbers, results that don't oscillate.






