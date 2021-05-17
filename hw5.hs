{--
Write the following programs in both Julia and Haskell. Assume there are no 
duplicates in the list of numbers.

Write a program to find all pairs of nums in a given list which add up to a given sum 
eg. if list = (1,3,8,12,7,11,9,4,2,10,5) and sum = 12
pair: (1,11), (2,10), (3,9), (4,8), (5,7)
Input: a list of numbers and a sum
Output: The list of pairs with the respective sum
--}


import Data.Set (Set)
import qualified Data.Set as Set
import Data.Map (Map)
import qualified Data.Map as Map


sumpairs' :: (Ord a, Num a) => [a] -> a -> Set a -> [(a, a)] -> [(a, a)]
sumpairs' (x:xs) s zs ys = 
    let diff = s - x in
    if Set.member diff zs then
        sumpairs' xs s zs ((diff, x):ys)
    else
        sumpairs' xs s (Set.insert x zs) ys
sumpairs' [] _ _ ys = ys

sumpairs :: (Ord a, Num a) => [a] -> a -> [(a, a)]
sumpairs list s = sumpairs' list s Set.empty []


{--
Extend your program to include all possible sums
eg. Sums = 5, 6, 7, 8, ..., 23
Input: A list of numbers
Output: a list of tuples where each tuple is the sum followed by the list of pairs.
--}

allsumpairs :: (Ord k, Num k) => [k] -> Map k [(k, k)]
allsumpairs [] = Map.empty
allsumpairs xs = allsumpairshelp xs [] Map.empty
  where
    allsumpairshelp (x:xs) ys m = allsumpairshelp xs (x:ys) (allsumpairs' x ys m)
    allsumpairshelp [] _ m = m

allsumpairs':: (Ord b, Num b) => b -> [b] -> Map b [(b, b)] -> Map b [(b, b)]
allsumpairs' x (y:ys) m =
  let pair = Map.findWithDefault [] (x + y) m in
  allsumpairs' x ys (Map.insert (x + y) ((x,y):pair) m)
allsumpairs' _ [] m = m



main :: IO ()
main = do
  print(sumpairs [1,3,8,12,7,11,9,4,2,10,5] 12)
  putStrLn " "
  print(allsumpairs [1,3,8,12,7,11,9,4,2,10,5])
