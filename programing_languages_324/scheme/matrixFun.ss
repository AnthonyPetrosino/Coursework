;; Anthony Petrosino
;; Jagged Matrix Lab

;; Inputs: number, matrix
;; See the bottom of the file for example tests

(define (question? n matrix)
  ;; Helper functions:
  (define (singleSorted? L)
    ;; Base case 1: If the list is empty, then it is sorted
    ;; Base case 2: If there is only one item in the list, it is sorted
    ;; Base case 3: If previous conditions are not met, the list is not sorted
    ;; Recursive case 1: If the first element of the list (car L) is
    ;; greater than the second letter of the list (cadr L), then recursively
    ;; call the function on the rest of the list
    ;; Uncomment these lines to display the process:
    ;; (display "List: ")
    ;; (display L)
    ;; (newline)
    
    (cond
      [(null? L) #t]  ;; Base case 1
      [(null? (cdr L)) #t]  ;; Base case 2
      [(<= (car L) (cadr L)) (singleSorted? (cdr L))]  ;; Recursive case
      [else #f]  ;; Base case 3
      )
    )
  
  (define (sorted? matrix)
    ;; Base case 1: If the matrix is empty, then all lists are sorted
    ;; Base case 2: If no other conditions are met, the lists are not sorted
    ;; Recursive case: Call helper function to check if individual lists
    ;; within the matrix are sorted
    ;; Uncomment these lines to display the process:
    ;; (display "Matrix: ")
    ;; (display matrix)
    ;; (newline)
    
    (cond
      [(null? matrix) #t]  ;; Base case 1
      [(singleSorted? (car matrix)) (sorted? (cdr matrix))]  ;; Recursive case
      [else #f] ;; Base case 2
      )
    )

  (define (listIndex n L)
    ;; Returns the number at index n of list L
    ;; Base case 1: If the list is empty, return 0
    ;; Base case 2: If the list is shorter than n, return 0
    ;; Base case 3: If we want the first item in the list, return car L
    ;; Recursive case: Continue through L until the nth position is in the
    ;; first position, disgarding the first item in the list and decreasing
    ;; n by 1 each time
    ;; Uncomment these lines to display the process:
    ;; (display "List: ")
    ;; (display L)
    ;; (newline)
    
    (cond
      [(null? L) 0]  ;; Base case 1
      [(<= (length L) n ) 0]  ;; Base case 2
      [(= n 0) (car L)]  ;; Base case 3
      [else (listIndex (- n 1) (cdr L))]  ;; Recursive case
      )
    )

  (define (sumColumn n matrix)
    ;; Base case 1: If there are no more lists to check in the matrix, return 0
    ;; Recursive case: If there are more lists to check in the matrix, call
    ;; the listIndex helper function on the first list in the matrix and add
    ;; what it returns to the result of recursively calling sumColumn onto the
    ;; rest of the list
    ;; Uncomment these lines to display the process:
    ;; (display "Matrix: ")
    ;; (display matrix)
    ;; (newline)
    (cond
      [(null? matrix) 0]  ;; Base case 1
      [(+ (listIndex (- n 1) (car matrix)) (sumColumn n (cdr matrix)))]  ;; Recursive case
      )
    )

  ;; Main funciton:
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

(question? 3 '((1 2 3) (2 3) (1 2 4 5)))
(question? 2 '((2 4 6 8 10 12) () (3) () ()))
(question? 5 '((1 2 3) (2 3) (1 2 5 9 9 9 9)))
(question? 6 '((1 2 3) (2 3) (1 2 4 5)))
(question? 4 '((1 2 3 4 5 6 7) (1 2 3) (5 4) ()))



