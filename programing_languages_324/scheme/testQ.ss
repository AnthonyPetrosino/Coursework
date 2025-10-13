;; Anthony Petrosino
;; Scheme Quiz

;; Idea: Check every in-order combination of numbers in each list
;; to see if they add up to num.

;; First, went for the full, ended up going for the partial credit. Mix of both.

(define (question? grid num)

  (define (add-nums lst)
    (cond
      [(null? lst) 0]
      [(number? lst) lst]
      [else (+ (car lst) (add-nums (cdr lst)))]
      )
    )

  (define (isRun? lst num)
    ;; Check to see if all numbers in list add up to num. If they do, return #t.
    ;; Base case 1: if there are no numbers to check, return #f.
    ;; Base case 2: if the run is of size 1, return #t if it is equal to num, else #f.
;; Anthony Petrosino
;; Scheme Quiz

;; Idea: Check every in-order combination of numbers in each list
;; to see if they add up to num.

;; First, went for the full, ended up going for the partial credit. Mix of both.

(define (question? grid num)

  (define (add-nums lst)
    (cond
      [(null? lst) 0]
      [(number? lst) lst]
      [else (+ (car lst) (add-nums (cdr lst)))]
      )
    )

  (define (isRun? lst num)
    ;; Check to see if all numbers in list add up to num. If they do, return #t.
    ;; Base case 1: if there are no numbers to check, return #f.
    ;; Base case 2: if the run is of size 1, return #t if it is equal to num, else #f.
;; Base case 3: if the numbers in the list add up to num, return #t.
    ;; Else, return false.
    (cond
      [(null? lst) #t]  ;; Base case 1
      [(number? lst) (if (equal? lst num) #t #f)]  ;; Base case 2
      [(equal? (add-nums lst) num) #t]
      [else #f]
      ))

  (define (checkRuns2 lst num)
    ;;(display "Inner: ")
    ;;(display lst)
    (cond
      [(null? lst) 0]
      [(number? lst) (if (isRun? lst num) 1 0)]
      [(equal? (length lst) 1) (if (isRun? lst num) 1 0)]
      [(equal? (length lst) 2) (if (isRun? lst num) 1 0)]
      [else (+ (checkRuns2 (car lst) num) (checkRuns2 (cadr lst) num))]
      )
  )
(define (checkRuns lst num)
    ;; Get each possible run within a list.
    ;; Base case 1: if there are no more runs to check, return 0.
    ;; Base case 2: if the entire list adds up to num, we can return 1.
    ;; 
    ;;(display "Checking ")
    ;;(display lst)
    (cond
      [(null? lst) 0]  ;; Base case 1
      [(isRun? lst num) 1]  ;; Base case 2
      [else (+ (checkRuns2 lst num) (checkRuns (cdr lst) num))]
      )

    )

     (begin
         (display "________________________")
         (newline)
         (display grid) (newline) (display "looking for run sums of ") (display num)
         (newline)

         (display "The sum appears ")
         ;;; code to call the helper function(s) go here
         (display (examineMatix grid num))
         (display " times.")
         (newline)

         (newline)
    )
)  ;; question


(display "Testing:  ")
 (newline)
;; Add appropriate additional test cases here, remove any below that do not work
;; This is not an exhaustive list of test cases, but it will get you started.
;;
(display "Example 0:")
(question?  '((1 2 3 1) (3 1 3 1) (9 0 7 0) (1 3 4 3)) 7 ) ;; Expect 8 (1 + 1 + 4 + 2)
(newline) (newline)

(display "Example 0.1:")
(question?  '((1 2 3) (2 3 3) (4 2 4)) 6 ) ;; Partial credit expected 3
(newline) (newline)
(display "Example 1:")
(question?  '((1 2 3 5) (3 1 3 1) (9 0 7 0) (1 3 4 3)) 7 ) ;; Expect 7 (0 + 1 + 4 + 2)
(newline) (newline)

(display "Example 2:")
(question? '((2 3 4 1 5) (6 2 4 1 1) (4 2 4 1 5)) 6)    ;; Expect 7 (1 + 3 + 3)
(newline)(newline)

(display "Example 3:")
(question? '((0 1 0 1 1 0) (0 0 0 0 0 0)) 1)   ;; Expect 8
(newline)(newline)
