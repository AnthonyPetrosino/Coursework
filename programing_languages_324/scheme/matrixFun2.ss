(define (rowSorted? lst)
  (cond
    [(null? lst) #t]
    [(number? lst) #t]
    [(null? (cdr lst)) #t]
    [(<= (car lst) (cadr lst)) (rowSorted? (cdr lst))]
    [else #f]
    )
  )

(define (sorted? matrix)
  (cond
    [(null? matrix) #t]
    [(number? (car matrix)) (rowSorted? matrix)]
    [(equal? (rowSorted? (car matrix)) (sorted? (cdr matrix))) #t]
    [else #f]
    )
  )

(define (column n lst)
  (cond
    [(null? lst) 0]
    [(equal? n 1) (car lst)]
    [else (column (- n 1) (cdr lst))]
    )
  )

(define (sumColumn n matrix)
  (cond
    [(null? matrix) 0]
    [(number? (car matrix)) (column n matrix)]
    [else (+ (column n (car matrix)) (sumColumn n (cdr matrix)))]
    )
  )

(define (question? n matrix)
   
    ;; define helper functions here

      (begin
         (newline)
         (display "__________________________________")
         (newline)
         (display matrix)
         (newline)
         (cond
             ((sorted? matrix)
                 (begin
                   (display "Every Row is in sorted order.")
                   (newline)
                   (display "The sum of column ")
                   (display n)
                   (display " is ")
                   (display (sumColumn n matrix))
                 ) ;; end begin
             ) ;; end sorted
             (else (display "The rows are not sorted."))
         ) ;; end cond
         (newline)
      ) ;; end begin
   
   ) ;; end question?