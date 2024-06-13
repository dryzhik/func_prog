(define (make-matrix m)
  (let ((Matrix m))
    (define (GetRow r)
      (if (= r 1) (car Matrix) (cadr Matrix)))
    
    (define (GetCol c)
      (if (= c 1)
          (map car Matrix)
          (map cadr Matrix)))

    (define (GetEl r c)
      (let ((row (GetRow r)))
        (if (= c 1) (car row) (cadr row))))

    (define (Plus n)
        (list (map + (GetRow 1) (n 'GetRow 1)) (map + (GetRow 2) (n 'GetRow 2))))

    (define (Mult n)
      (
        list
          (list (apply + (map * (car Matrix) (n 'GetCol 1)))
                (apply + (map * (car Matrix) (n 'GetCol 2))))
          (list (apply + (map * (cadr Matrix) (n 'GetCol 1)))
                (apply + (map * (cadr Matrix) (n 'GetCol 2))))))

    (define (Transp)
      (list (list (GetEl 1 1) (GetEl 2 1))
            (list (GetEl 1 2) (GetEl 2 2))))

    (define (DigitMult d)
      (map (lambda (row) (map (lambda (x) (* d x)) row)) Matrix))

    (define (VecMult v)
      (list (apply + (map * (car Matrix) v))
            (apply + (map * (cadr Matrix) v))))

    (define (Display)
      (format #t "~a\n~a" (GetRow 1) (GetRow 2)))

    (lambda args
      (apply 
        (case (car args)
          ((GetRow) GetRow)
          ((GetCol) GetCol)
          ((GetEl) GetEl)
          ((Plus) Plus)
          ((Mult) Mult)
          ((Transp) Transp)
          ((DigitMult) DigitMult)
          ((VecMult) VecMult)
          ((Display) Display)
          (else (begin (display "Invalid method\n") (exit 1))))
        (cdr args)))))

(define m (make-matrix '((1 2) (3 4))))
(define n (make-matrix '((5 6) (7 8))))
(define v '(2 3))

(newline)
(display "Matrix 1: ") (newline)
(m 'Display) 
(newline)
(newline)

(display "Matrix 2: ") (newline)
(n 'Display) 
(newline)
(newline)

(display "MATRIX_1:: Row 1: ") (display (m 'GetRow 1)) (newline)
(display "MATRIX_1:: Col 2: ") (display (m 'GetCol 2)) (newline)
(display "MATRIX_1:: Element (1,2): ") (display (m 'GetEl 1 2)) (newline)
(display "MATRIX_1:: Transpose: ") (display (m 'Transp)) (newline)
(display "MATRIX_1:: Scalar Multiplication (* 2): ") (display (m 'DigitMult 2)) (newline)
(display "MATRIX_1:: Vector Multiplication (* (2 3)): ") (display (m 'VecMult v)) (newline)
(display "Sum: ") (display(m 'Plus n)) (newline)
(display "Mult: ") (display (m 'Mult n)) (newline)

