(define (magic? matrix)
   
    ;; define helper functions here
  (define (matrixSize? lst)
    (cond
      [(null? lst) 0]
      [(number? lst) 1]
      [else (+ 1 (matrixSize? (cdr lst)))]
      )
    )


  (define (rowSum lst)
    (cond
      [(null? lst) 0]
      [(number? lst) lst]
      [else (+ (car lst) (rowSum (cdr lst)))]
      )
    )
  
  (define (magicRows matrix)
    (cond
      [(null? matrix) '()]
      [else (cons (rowSum (car matrix)) (magicRows (cdr matrix)))]
      )
    )

  (define (endMsg matrix)
    (cond
      [(endMsgHelp (magicRows matrix)) (display "Equal")]
      [else (display "not equal")]
      )
    )

  (define (endMsgHelp lst)
     (cond
      [(null? lst) #t]
      [(number? (car lst)) #t]
      [(= (car lst) (cadr lst)) (endMsgHelp (cdr lst))]
      [else #f]
     )
    )
   

      (begin
         (display "____________Info_____________")
         (newline)
         (display matrix)
         (newline)
         (display "Number of elements in each row: ")
         (display (matrixSize? (car matrix)))
         (newline)
         (display (magicRows matrix))
         (newline)
         (endMsg matrix)
      )
   
   )
  