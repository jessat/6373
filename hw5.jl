# Write the following programs in both Julia and Haskell. Assume there are no 
# duplicates in the list of numbers.

# Write a program to find all pairs of nums in a given list which add up to a given sum 
# eg. if list = (1,3,8,12,7,11,9,4,2,10,5) and sum = 12
# pair: (1,11), (2,10), (3,9), (4,8), (5,7)
# Input: a list of numbers and a sum
# Output: The list of pairs with the respective sum


function sumpairs(list, sum, tried = Set(), pairs = [])
  if isempty(list)
    return pairs
  end
  
  key = list[1]
  diff = sum - key
  diff in tried ? push!(pairs, (key, diff)) : push!(tried, key)

  return sumpairs(list[2:end], sum, tried, pairs)
end

println(sumpairs([1,3,8,12,7,11,9,4,2,10,5], 7))



# Extend your program to include all possible sums
# eg. Sums = 5, 6, 7, 8, ..., 23
# Input: A list of numbers
# Output: a list of tuples where each tuple is the sum followed by the list of pairs.

function allsumpairs(values, tried = Set(), pairs = Dict())
  if isempty(values)
    return pairs
  end

  curr = values[1]

  for triedval in tried
    pair = (triedval, curr)
    sum = triedval + curr
    haskey(pairs,sum) ? (currpairs = pairs[sum]; push!(currpairs, pair)) : pairs[sum] = [pair]
  end #end for loop

  push!(tried, curr)

  return allsumpairs(values[2:end], tried, pairs)
end

println(sort!(collect(allsumpairs([1,3,8,12,7,11,9,4,2,10,5]))))
