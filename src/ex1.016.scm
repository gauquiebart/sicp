(load "./test-manager/load.scm")

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt-recursive b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt-recursive b (/ n 2))))
	(else (* b (fast-expt-recursive b (- n 1))))))


(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
	((even? n) (fast-expt-iter (square b) (/ n 2) a))
	(else (fast-expt-iter b (- n 1) (* a b)))))

; a * b ^ n = constant

; 1 * 3 ^ 2 = 9
; 1 * 9 ^ 1 = 9
; 9 * 9 ^ 0 = 9

; 1 * 3 ^ 4 = 81
; 1 * 9 ^ 2 = 81
; 1 * 81 ^ 1 = 81
; 81 * 81 ^ 0 = 81

; 1 * 3 ^ 7 = 2187
; 3 * 3 ^ 6 = 2187
; 3 * 9 ^ 3 = 2187
; 27 * 9 ^ 2 = 2187
; 27 * 81 ^ 1 = 2187
; 2187 * 81 ^ 0 = 2187

; 1 * 3 ^ 8 = 6561
; 1 * 9 ^ 4 = 6561
; 1 * 81 ^ 2 = 6561
; 1 * 6561 ^ 1 = 6561
; 6561 * 6561 ^ 0 = 6561

(define-test (expt)
  (assert-= (fast-expt-recursive 5 7)
	    78125)
  (assert-= (fast-expt-recursive 5 8)
	    390625)
  (assert-= (fast-expt 3 0)
	    1)
  (assert-= (fast-expt 3 1)
	    3)
  (assert-= (fast-expt 3 2)
	    9)
  (assert-= (fast-expt 3 3)
	    27)
  (assert-= (fast-expt 3 4)
	    81)
  (assert-= (fast-expt 3 7)
	    2187)
  (assert-= (fast-expt 3 8)
	    6561)
  (assert-= (fast-expt 5 7)
	    78125)
  (assert-= (fast-expt 5 8)
	    390625))

(run-registered-tests)


























