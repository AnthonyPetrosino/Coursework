;; Anthony Petrosino
;; The function sumAdd adds up all numerical elements in a list and returns the sum.

(define (sumAdd-2 L)
  (cond
    [(null? L) 0]  ;; Base case 1
    [(list? (car L)) (+ (sumAdd-2 (car L)) (sumAdd-2 (cdr L)))]
    [else (+ (car L) (sumAdd-2 (cdr L)))]
    )
  )

(define (sumAdd L)
  (cond [(number? L) L]  ;; If L is a single number, return L
        [(null? L) 0]  ;; If L is anything other than a list, return 0 (base case)
        [(list? (car L)) (+ (sumAdd (car L)) (sumAdd (cdr L)))]  ;; If (car L) is a list, recursively call sumAdd within (car L)
        [(number? (car L)) (+ (car L) (sumAdd (cdr L)))]  ;; If (car L) is a number, add (car L) to a recursive call of the rest of the list
        [else (sumAdd (cdr L))]  ;; When (car L) isn't a number, skip it
        )
)
