require_relative 'euler_utils'
numbers = {}
9999.times {|i| numbers.merge!({i+1 => get_divisors(i+1).reduce(:+) - (i+1)} )}
sum = 0
#if the numbers point to each other and does not point to itself
numbers.each_key { |k| sum += k if numbers[numbers[k]] == k && numbers[k] != k}
p sum
