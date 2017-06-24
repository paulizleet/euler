n_minus_two = 0
n_minus_one = 1
n = 1
sum = 0
while n < 4000000 do

  n_minus_two = n_minus_one
  n_minus_one = n

  n = n_minus_two + n_minus_one

  sum += n if n % 2 == 0

end

p sum
