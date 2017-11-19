
def is_palindrome?(n)
  recurse(n.to_s.chars)
end

def recurse(arr)
  return false if arr[0] != arr[-1]
  return true if arr.length == 0
  return recurse(arr[1..-2])

end

def to_base_two(n)
  byte_rep = []
  while n > 0 do
    byte_rep << n % 2
    n /= 2
  end

  byte_rep.join

end

# p to_base_two(2)
# p to_base_two(3)
# p to_base_two(4)
# p to_base_two(16)
# p to_base_two(31)
sum = 0

1000000.times do |i|
  next if i % 2 == 0
  next if !is_palindrome?(i)
  next if !is_palindrome?(to_base_two(i))
  sum += i
end

puts sum
