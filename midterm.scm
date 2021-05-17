; Write programs in Haskell, and Scheme that reverses a simple list of integers 
; using recursion; specifically, in tail recursive form. Do not use higher order 
; functions such as “reverse”, comprehensive lists or functions from a library


(define (rev lst)
  (rev' lst '()))  

(define (rev' old new)
  (if (null? old) new  
      (rev' (cdr old) (cons (car old) new))))

(rev '(1 2 3 4 5))
