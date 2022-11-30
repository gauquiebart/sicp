(define (gcd a b) 
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

;normal order evaluation with substitution method
;"fully expand and then reduce" 

(gcd 206 40)

(if (= 40 
       0) 
    206 
    (gcd 40 
	 (remainder 206 
		    40)))

(gcd 
 40 
 (remainder 206 40))

(if (= (remainder 206 
		  40) 
       0) 
    (remainder 206 
	       40) 
    (gcd (remainder 206 
		    40) 
	 (remainder 40 
		    (remainder 206 40))))

;remainder evaluated 1 times

(gcd 
 (remainder 206 
	    40) 
 (remainder 40 
	    (remainder 206 
		       40)))

(if (= (remainder 40 
		  (remainder 206 
			     40)) 
       0) 
    (remainder 206 
	       40) 
    (gcd (remainder 40 
		    (remainder 206 
			       40)) 
	 (remainder (remainder 206 
			       40) 
		    (remainder 40 
			       (remainder 206 
					  40)))))

;remainder evaluated 1 + 2 times

(gcd 
 (remainder 40 
	    (remainder 206 
		       40)) 
 (remainder (remainder 206 
		       40) 
	    (remainder 40 
		       (remainder 206 
				  40))))

(if (= (remainder (remainder 206 
			     40) 
		  (remainder 40 
			     (remainder 206 
					40)))
       0)
    (remainder 40 
	       (remainder 206 
			  40))
    (gcd (remainder (remainder 206 
			       40) 
		    (remainder 40 
			       (remainder 206 
					  40)))
	 (remainder (remainder 40 
			       (remainder 206 
					  40))
		    (remainder (remainder 206 
					  40) 
			       (remainder 40 
					  (remainder 206 
						     40))))))

;remainder evaluated 1 + 2 + 4 times

(gcd (remainder (remainder 206 
			   40) 
		(remainder 40 
			   (remainder 206 
				      40)))
     (remainder (remainder 40 
			   (remainder 206 
				      40))
		(remainder (remainder 206 
				      40) 
			   (remainder 40 
				      (remainder 206 
						 40)))))

(if (= (remainder (remainder 40 
			     (remainder 206 
					40))
		  (remainder (remainder 206 
					40) 
			     (remainder 40 
					(remainder 206 
						   40))))
       0)
    (remainder (remainder 206 
			  40) 
	       (remainder 40 
			  (remainder 206 
				     40)))
    (gcd (remainder (remainder 40 
			       (remainder 206 
					  40))
		    (remainder (remainder 206 
					  40) 
			       (remainder 40 
					  (remainder 206 
						     40))))
	 (remainder (remainder (remainder 206 
					  40) 
			       (remainder 40 
					  (remainder 206 
						     40)))
		    (remainder (remainder 40 
					  (remainder 206 
						     40))
			       (remainder (remainder 206 
						     40) 
					  (remainder 40 
						     (remainder 206 
								40)))))))

;remainder evaluated 1 + 2 + 4 + 7 times
    
(remainder (remainder 206 
			  40) 
	       (remainder 40 
			  (remainder 206 
				     40)))

;remainder evaluated 1 + 2 + 4 + 7 + 4 times = 18 times

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))

(gcd 40 6)

;remainder evaluated 1 times

(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))

(gcd 6 (remainder 40 6))

(gcd 6 4)

;remainder evaluated 2 times

(if (= 4 0)
    6
    (gcd 4 (remainder 6 4)))

(gcd 4 (remainder 6 4))

(gcd 4 2)
;remainder evaluated 3 times

(if (= 2 0)
    4
    (gcd 2 (remainder 4 2)))

(gcd 2 (remainder 4 2))

(gcd 2 0)
;remainder evaluated 4 times

(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))

2 

; so normal-order evaluation: 18
; applicative-order evaluation: 4





 
