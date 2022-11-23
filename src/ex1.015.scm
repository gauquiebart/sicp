(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)

;a/ 
(p (sine 4.05))
(p (p (sine 1.349999999)))
(p (p (p (sine .4499999966666666))))
(p (p (p (p (sine .14999999888888887)))))
(p (p (p (p (p (sine .04999999962962962))))))

; 5 times

; b/
; We notice that on each application the sine angle is divided by 3. So the problem reduces in each step by a factor of 3.
; So both the space and the number of steps is reduced logarithmically. 
; O(log(a)) for both space and number of steps.

