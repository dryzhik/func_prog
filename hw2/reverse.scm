(define data '(1 2 3 4 5 6 7 8 9 0))

(define Reverse 
    (lambda (l)
        (let loop ((l l) (res '()))
            (if (null? l) res
                (loop (cdr l) (cons (car l) res)
                )
            )
        )
    )
)

(format #t "Reverse ~a\n" (Reverse data))