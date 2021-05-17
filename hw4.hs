{--
Previously, you were shown how calculations could be made more efficient by making use of closures. 
Specifically, you were shown how in Python that by enclosing the Fibonacci function fib() inside of an 
environment that included a dictionary of all previous calls to fib() with their results. By recording 
previous results the call to fib() went from a recursive call to one of only looking up the previous 
two values. In this exercise you will use a Monad to save the state of the previous two calls to fib() 
and use these two values to calculate the new value of fib() and then update the state with new values 
for the previous two calls to fib().  The unadorned version of fib():

fib :: Int -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
main = print (fib 50)


In this case the State will be the previous version of fib() i.e. fib(n-1) and fib(n-2). The initial 
State will be (0,0) and you may use the module for FibStateful as shown:
--}

-- professor's code  -- 

module FibStateful
 (
 FibState (..),
 FibStateful,
 getPreviousNumber,
 setPreviousNumber,
 getPreviousPreviousNumber,
 setPreviousPreviousNumber,
 getCurrentNumber,
 setCurrentNumber,
 ) where
-- |The data type containing all the state that we need during our calculation
data FibState = FibState {
 previousNumber :: Integer,
 previousPreviousNumber :: Integer,
 currentNumber :: Integer
}

------------
-- A function that takes state and produces a new, updated state, along with its normal return value
type FibStateful a = FibState -> (FibState, a)
------------

-- Some helper functions that make it easier to access that state.
-- These functions are getters and setters.
-- The setters effectively act like assignment operators by mutating state! 
-- Note that the empty tuple () means that the function doesn't produce a useful result, it only updates the state; () is therefore like void.

-- For each getter function, we just extract the appropriate value from the old state and return it, along with the the unchanged state.

-- For each setter, we return a modified state, which is the same as the old state, except for the one field that we're updating. 
-- We also return () to indicate that the function doesn't produce a useful value.

getPreviousNumber :: FibStateful Integer
getPreviousNumber oldstate = (oldstate, previousNumber oldstate)

setPreviousNumber :: Integer -> FibStateful ()
setPreviousNumber newval oldstate =
 (FibState {previousNumber = newval,
            previousPreviousNumber = previousPreviousNumber oldstate,
            currentNumber = currentNumber oldstate}, ())

getPreviousPreviousNumber :: FibStateful Integer
getPreviousPreviousNumber oldstate = 
 (oldstate, previousPreviousNumber oldstate)

setPreviousPreviousNumber :: Integer -> FibStateful ()
setPreviousPreviousNumber newval oldstate =
 (oldstate {previousPreviousNumber = newval,
    previousNumber = previousNumber oldstate,
    currentNumber = currentNumber oldstate}, () )

getCurrentNumber :: FibStateful Integer
getCurrentNumber oldstate = (oldstate, currentNumber oldstate)

setCurrentNumber :: Integer -> FibStateful ()
setCurrentNumber newval oldstate = 
 (oldstate {currentNumber = newval,previousPreviousNumber =
   previousPreviousNumber oldstate,
   previousNumber = previousNumber oldstate}, ())

-- ^ professor's code ^ -- 


-- assignment submission:
fib :: FibState -> Int -> FibState
fib fs n
  | n == 0 = fs
  | otherwise = do 
    let pp = snd (getPreviousPreviousNumber fs)
    let p = snd (getPreviousNumber fs)
    let pp' = fst (setPreviousPreviousNumber p fs)
    let p' = fst (setPreviousNumber (pp + p) pp')
    let c = fst (setCurrentNumber (pp + p) p') 
    fib c (n-1) --update the state recursively

main = print(snd(getCurrentNumber (fib (FibState 0 1 1) 20)))
