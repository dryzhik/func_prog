(define-syntax memoize
  (syntax-rules ()
    ((_ (define (name . args) . body))
     (begin
       (define cache (make-hash-table))
       (define (name . args)
         (let ((key (list . args)))
           (or (hash-ref cache key #f)
               (let ((result (begin . body)))
                 (begin
                  (display "Аргумент:  ")
                  (display (list . args))
                  (newline) 
                  (hash-set! cache key result)
                  result)))))))))

(memoize 
 (define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2))))))

(display "Первый раз вычисляем fib 10: ")
(newline)
(display (fib 10)) ; Ожидаемый результат: 55
(newline)
(display "fib 5: ") ; Ожидаемый результат: 5
(display (fib 5))
(newline)
(display "Второй раз вычисляем fib 10: ")
(display (fib 10)) ; Ожидаемый результат: 55
(newline)
(display (fib 30)) ; Ожидаемый результат: 832040
(newline)

