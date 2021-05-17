# Given a string containing brackets [], braces {}, parentheses (), 
# or any combination thereof, verify that any and all pairs are 
# matched and nested correctly.

function areBracketsBalanced(expr::String)
    s = [] #stack
    open = ['(','{','[']
    close = [')','}',']']
    matches = Dict(')' => '(', '}' => '{', ']' => '[')
    c = "" # char to compare against

    for char in expr
      if char in open
        push!(s, char)
      end
      if char in close
        if isempty(s) == false
          c = pop!(s)
        end
        if (c != matches[char]) # stop if no dict match exists
          return false
        end
      end
    end
      
    return isempty(s)
end
 
println(areBracketsBalanced("(){}[]")) #true
println(areBracketsBalanced("{jessie}")) #true
println(areBracketsBalanced("([]")) #false
println(areBracketsBalanced("()}[]")) #false
println(areBracketsBalanced("")) #true
