;; DrRacket Notes
; Anthony Petrosino


;; conditionals
; cons, append and list
(print 'cons-append-list)
(newline)
(cons 'x '(1 2))
(cons '(1 5) '(2 3))
(append '(1) '(2 3))
(append '(1 5) '(2 3))
(list '1 '2 '3 '(4 5))

; map applies a procedure to one or more lists and returns
; a new list containing the result
(print 'map)
(newline)
(map + '(5 4 7) '(4 5 6))
(map < '(5 4 7) '(4 5 6))

; comparison operators
(print 'comparison-operators)
(newline)
(equal? '(hi there) '(hi there))
(equal? 3 3)
(equal? 3 (+ 2 1))
(equal? 3 3.0)
(equal? 3 (/ 6 2))
(equal? -1/2 -0.5)
; (= '(hi there) '(hi there))
; (= '(hi there) '(bye now))
(= 3 3)
(= 3 (+ 2 1))
(= 3 3.0)
(= 3 (/ 6 2))
(= -1/2 -0.5)

(print 'contitionals)
(newline)
; if 8 = 4 return 9 else return 10
(if (= 8 4)
    9
    10)
; list of conditionals, are checked in order
(cond [(= 3 3) (+ 3 8)]
      [(= 16 8) 12]
      [else (* 6 3)])


;; functions
; lambdas
(lambda (x)
   (+ x 1))
; functionally the same
(define add-one (lambda (x)(+ x 1)))
(define (add-1 x) (+ x 1))
(define another-add-one add-one)

; let allows us to declare local variables
(define a 5)
(define b 6)
(define c 7)
(define strange
    (lambda (x)
      (let ((a 1) (b 2))
        (+ x a b))))

(define (mystery L)
     (if (null? L)
         L
         (begin
           (display L)
           (newline)
           (append (mystery (cdr L))
                   (list (car L))))))
