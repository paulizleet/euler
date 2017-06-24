

sum = (1..100).inject{|sum, i| sum + i**2}

square_sum = (1..100).reduce(:+) ** 2

p square_sum - sum
