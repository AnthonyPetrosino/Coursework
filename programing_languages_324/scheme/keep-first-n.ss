;; Anthony Petrosino
; keep-first-n
; Example input: (keep-first-n 3 '(a b c d e f g h i))
; Expected output: (a b c)

; Strategy:
; Base case: If n < 1, or the list is empty, return an empty list.
; Recursive case: Take (car list) and cons it to a recursive call of
; keep-first-n with (- n 1) and (cdr list) as parameters.

(define (keep-first-n n list)
  (if (or (< n 1) (null? list))
      '()  ; Base case
      (cons (car list)
            (keep-first-n (- n 1) (cdr list)))  ; Recursive case
      ))

(define (keep-first-n-2 n l)
  (cond
    [(< n 1) '()]
    [(null? l) '()]
    [else (cons (car l) (keep-first-n-2 (- n 1) (cdr l)))]
    )
  )