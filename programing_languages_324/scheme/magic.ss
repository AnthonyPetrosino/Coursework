;; Anthony Petrosino
;; Magic Rows

;; Helper functions
(define (listSum list)
  ;; Simple recursive function that returns the sum of numbers in a list, no error checking
  ;; Base case: if list is empty, return 0
  ;; Recursive case: if list isn't empty, add next element to the rest of the list
  (if (null? list)
      0  ;; Base case
      (+ (car list) (listSum (cdr list)))  ;; Recursive case
      )
  )

(define (magicRows matrix)
  ;; Returns a list containing the sum of each "row" in the matrix
  ;; Base case 1: if there are no more lists to add, return an empty list
  ;; Base case 2: if the matrix is only a list of numbers, return the result of (listSum list)
  ;; Recursive case: if there are more lists to add, cons the listSum result of the car list
  ;; with a recursive call of magicRows on cdr matrix
  (cond [(null? matrix) '()]  ;; Base case 1
        [(number? (car matrix)) (listSum matrix)]  ;; Base case 2
        [else (cons (listSum (car matrix)) (magicRows (cdr matrix)))]  ;; Recursive case
        )
  )

(define (rowSumsCheck list)
  ;; Recursively compares numerical contents of a list to see if they are all equal
  ;; Base case 1: if the matrix is empty, inform the user
  ;; Base case 2: if there is only one item in the list, return it
  ;; Recursive case: check if the first and second items in the list are the same
  ;; Base case 3: if not recursive case, row sums are not the same, and we can continue on to our else condition
  (cond [(null? list) (display "The matrix is empty.")]  ;; Base case 1
        [(null? (cdr list)) (display "Row sums are identical!")]  ;; Base case 2
        [(equal? (car list) (cadr list)) (rowSumsCheck (cdr list))]  ;; Recursive case
        [else (display "Row sums are not the same.")]  ;; Base case 3
        )
  )


(define (calcLength list)
  ;; Returns the length of the given list
  (if (null? list)
      0
      (length (car list))
      )
  )

(define (magic? matrix)
  ;; Main function
  (begin
    (display "____________Info_____________")
    (newline)
    (display matrix)
    (newline)
    (display "Number of elements in each row: ")
    (display (calcLength matrix))  ;; This only works with the guarentee the matrix is a square
    (newline)
    (display (magicRows matrix))  ;; Display sum of each row
    (newline)
    (rowSumsCheck (magicRows matrix))  ;; Check to see if the sums of each row are equal
    )
  )

;; Test expressions:
(display "Here are some test expressions.")
(newline)
(display "Test 1:")
(newline)
(magic? '((0 0 1) (1 1 1) (1 1 1)))
(newline)
(display "Test 2:")
(newline)
(magic? '())
(newline)
(display "Test 3:")
(newline)
(magic? '((1 2 3 4 6) (2 3 4 5 2) (3 4 5 2 2) (4 5 2 2 3) (6 2 2 3 3)))

