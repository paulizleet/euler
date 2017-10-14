# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

# What is the highest number possible? 99999?

require_relative 'euler_utils'

factorials={}
(0..9).each{ |i| factorials.merge!( {i => factorial(i) } ) }

sum = 0
99999.times do |i|
  next if i < 3
  sum2 = 0
  get_digits(i).each {|j| sum2 += factorials[j]}
  sum += i if sum2 == i
end

p sum
