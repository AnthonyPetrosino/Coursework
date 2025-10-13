;; Anthony Petrosino
;; Scheme Quiz Prep

;; Question: diagonal sum
;; Given a matrix, check if it is a square.
;; If it is, return the two diagonal sums of that square,
;; and check if those sums are equal.
;; If it is not, tell the user it is not a square.

(define (diagonal-sum? matrix)

  (define (length? lst)
    ;;(display " list -> ")
    ;;(display lst)
    (cond
      [(null? lst) 0]
      [(list? lst) (+ 1 (length? (cdr lst)))]
      [(number? lst) 1]
      ))

  (define (square? matrix)
    ;;(display matrix)
    (cond
      [(null? matrix) #t]
      [(number? (car matrix)) #t]
      [(equal? (length? (car matrix)) (length? (cadr matrix))) (square? (cdr matrix))]
      [else #f]
      ))
  
  (begin
    (display "--- diagonal sum ---")
    (newline)
    (display matrix)
    (newline)
    ;;(display (square? matrix))
    (cond
      [(square? matrix)
       (begin (display "Is a square.")
        (newline)
        (display "Main diagonal sum: ")
        )]
      [else (display "Not a square")]
      )
    )
  )