-- Write programs in Haskell, and Scheme that reverses a simple list of integers 
-- using recursion; specifically, in tail recursive form. Do not use higher order 
-- functions such as “reverse”, comprehensive lists or functions from a library

rev :: [a] -> [a]
rev xs = rev' xs []

rev' :: [a] -> [a] -> [a]
rev' [] ys = ys
rev' (x:xs) ys = rev' xs (x:ys)
