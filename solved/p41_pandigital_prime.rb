# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?


require_relative "euler_utils"

def join_big_number(num)
  sum = 0
  num.each_with_index {|n, i| sum += n * (10 ** i)}
  sum
end

n = 9
i = 0
largest = 0
while largest == 0 do
  perms = get_permutations((1..n).to_a)
  puts "got permutations of #{n}"
  prime = false
  i = perms.length
  while !prime && i > 0 do
    i -= 1
    next if [0,2,4,5,6,8].include?(perms[i][0])
    big = join_big_number(perms[i])
    if is_prime?(big)
      big > largest ? largest = big : nil
    end
  end
  n-=1
end
p largest
