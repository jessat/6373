-- Write a program that finds the maximum of a simple list of numbers.
maxnum :: Ord p => [p] -> p
maxnum [] = error "empty list"
maxnum (x:xs) = maxnum' x xs
  where
  maxnum' y [] = y
  maxnum' y (x:xs)
    | x > y = maxnum' x xs
    | otherwise = maxnum' y xs

-- Write a program that succeeds if the intersection of two given list parameters is empty.
intersectbool :: Eq a => [a] -> [a] -> Bool
intersectbool _ [] = True
intersectbool [] _ = True
intersectbool (x:xs) ys 
    | elem x ys = False
    | otherwise = intersectbool xs ys

-- Write a program that returns a list containing the union of the elements of two given lists. 
--Assume the list represents sets (i.e. unique elements) and the union returns unique elements.
union :: Eq a => [a] -> [a] -> [a]
union [] y = y
union x [] = x
union xs (y:ys)
  | elem y xs = union xs ys  
  | otherwise = union (y:xs) ys


-- Write a program that returns the final element of a list
finalelement :: Ord p => [p] -> p
finalelement [] = error "empty list"
finalelement [x] = x
finalelement (x:xs) = finalelement xs
