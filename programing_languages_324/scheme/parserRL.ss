;; Anthony Petrosino
;; Arithmetic Parser

;; Doesn't properly handle missinputs. For example: (parse '(-)) -> 1.

(define (parse input)
  (display input)
  (cond [(number? input) input]  ;; If input is a single number, return input (base case)
        [(symbol? input) 1]  ;; If input is a variable, we want to return 1 (base case)
        [(null? input) 0]  ;; If input is null, return 0 (base case)
        [(not (list? input)) 0]  ;; If input is anything other than a list, return 0 (base case)
        [(= (length input) 1) (parse (car input))]  ;; If input is a list with only one item (ex: (1) or (q)), return a recursive call on that item
        [(list? (car input)) (parse (car input))]  ;; If (car input) is a list, recursively call parse within (car input)
        [else (cond [(equal? (cadr input) '+) (+ (parse (car input)) (parse (cddr input)))]  ;; If (cadr input) is +, add the first element to the rest
                    [(equal? (cadr input) '-) (- (parse (car input)) (parse (cddr input)))]  ;; If (cadr input) is -, subtract the rest from the first element
                    [(equal? (cadr input) '*) (* (parse (car input)) (parse (cddr input)))]  ;; If (cadr input) is *, multiply the first element by the rest
                    [(equal? (cadr input) '/) (/ (parse (car input)) (parse (cddr input)))]  ;; If (cadr input) is /, divide the first element by the rest
                    [else 0])  ;; If (cadr input) is not a valid operator, return 0
              ]
        )
  )