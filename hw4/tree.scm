(define Tree '(
                ( 
                   (() 4 ()) 
                   2 
                   (() 5 ()) 
                 ) 
                 1 
                 ( 
                   (() 6 ()) 
                   3 
                   (() 7 ())
                 )
               )
)

(define left-branch car)
(define right-branch caddr)
(define node-value cadr)

(define (make-tree-iterator tree)
  (let ((caller #f))
    (letrec ((traverse  ;; traverse procedure
                       (lambda ()
                         (let loop ((tree tree))
                           (if (not (null? tree))
                               (begin
                                 (loop (left-branch tree))
                                 ;; -- do st-th with key
                                 (call/cc (lambda (rest-of-tree) 
                                            (set! traverse (lambda () (rest-of-tree 'dummy)))
                                            (caller (node-value tree))))
                                 (loop (right-branch tree)))))
                         (caller 'end))))
      (lambda () ;; iterator procedure
        (call/cc (lambda (k) (set! caller k) (traverse)))))))

(define (trees-equal? tree1 tree2)
  (let ((iter1 (make-tree-iterator tree1))
        (iter2 (make-tree-iterator tree2)))
    (call/cc
     (lambda (return)
       (let loop ()
         (let ((val1 (iter1))
               (val2 (iter2)))
           (cond ((and (eq? val1 'end) (eq? val2 'end)) #t)
                 ((or (eq? val1 'end) (eq? val2 'end)) (return #f))
                 ((not (equal? val1 val2)) (return #f))
                 (else (loop)))))))))

(define Tree2 '(
                ( 
                   (() 4 ()) 
                   2 
                   (() 5 ()) 
                 ) 
                 1 
                 ( 
                   (() 6 ()) 
                   3 
                   (() 7 ())
                 )
               )
)

(define Tree3 '(
                ( 
                   (() 4 ()) 
                   2 
                   (() 5 ()) 
                 ) 
                 1 
                 ( 
                   (() 6 ()) 
                   3 
                   (() 8 ())
                 )
               )
)

(display (trees-equal? Tree Tree2)) ; Ожидаемый результат: #t
(newline)
(display (trees-equal? Tree Tree3)) ; Ожидаемый результат: #f
(newline)
