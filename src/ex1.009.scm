;; define the 'primitives'

(define inc (lambda (x) (+ x 1)))
(define dec (lambda (x) (- x 1)))

(define (plus-recursive a b)
  (if (= a 0)
      b
      (inc (plus-recursive (dec a) b))))

; recursive process, because to return a result for plus-recursive, the internal recursive call still needs to be incremented (inc (plus-recursive ...

(plus-recursive 4 5)
(inc (plus-recursive (dec 4) 5))
(inc (plus-recursive 3 5))
(inc (inc (plus-recursive (dec 3) 5)))
(inc (inc (plus-recursive 2 5)))
(inc (inc (inc (plus-recursive (dec 2) 5))))
(inc (inc (inc (plus-recursive 1 5))))
(inc (inc (inc (inc (plus-recursive (dec 1) 5)))))
(inc (inc (inc (inc (plus-recursive 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

(define (plus-iterative a b)
  (if (= a 0)
      b
      (plus-iterative (dec a) (inc b))))

;iterative process; because each recursive call has all the state needed to continue with the process.(the program variables provide a complete description of the state of the process at any point)

(plus-iterative 4 5)
(plus-iterative 3 6)
(plus-iterative 2 7)
(plus-iterative 1 8)
(plus-iterative 0 9)
9




