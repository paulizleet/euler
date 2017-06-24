def is_palindrome?(n)
  recurse(n.to_s.chars)
end

def recurse(arr)
  return false if arr[0] != arr[-1]
  return true if arr.length == 0
  return recurse(arr[1..-2])

end

def run
  j = 999
  palindromes = []
  while j >= 100 do
    i = 999
    while i >= 100 do
      palindromes << i*j if is_palindrome?(i*j)
      i-=1
    end
    j-=1
  end
  palindromes.max
end

p run
