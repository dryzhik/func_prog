;; (define width 3) - задали глобальную переменную
;; (define (square x) (* x x)) - объявление функции (define (название параметр параметр …) тело_функции)
;; 

; (letrec ((fact (lambda (n) (cond((= n 0) 1)
;                         (else (* n (fact (- n 1))))))))
;   (fact 4))

; (define m  '((1 2) (3 4)))
; (display (car m)) (newline); (1 2) 
; (display (cadr m)) (newline); (3 4)
; (display (caar m)) (newline); 1
; (display (cadar m)) (newline); 2
; (display (caadr m)) (newline); 3
; (display (car(cdr(cadr m)))) (newline); 4

; (define l '(123 987))
; (define l2 '(345 789))

; (display (apply * (list 1 2 3 4 5 6)))
