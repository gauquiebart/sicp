(load "./test-manager/load.scm")
(define (add a b) (+ a b))
(in-test-group fun-with-scheme
  (define-test (add-returns-two)
    "1+1=2"
    (assert-= (add 1 1) 2 "What happened?"))
  (define-test (add-returns-three)
    "1+2+1=4"
    (assert-= (add 1 3) 4 "Test?")))
(run-registered-tests)

