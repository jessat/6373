#|
Write a function that takes two lists of integers and returns a list containing tuples with 
corresponding elements from both the lists. For example:
f ([1, 2, 3], [4, 5, 6]) -> [(1, 4), (1,5), (1,6), (2, 4), (2, 5), (2, 6), (3, 4), (3 ,5), (3, 6)]. 
If either list is null, the result is null. The lists do not have to be the same length. Solve 
this using recursion.  You may NOT use the length() function or lambda() function or comprehension 
lists to do your solution.
|#

(define (f lst1 lst2)
  (if (or (null? lst1) (null? lst2)) '()
  (cons (list (car lst1) (car lst2)) 
  (append (f (list (car lst1)) (cdr lst2)) (f (cdr lst1) lst2)))))

(f '(1 2 3)'(4 5 6))
