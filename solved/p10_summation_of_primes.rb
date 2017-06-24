require_relative 'euler_utils'


sieve = prime_sieve(2000000)
sum = 0
sieve.each_with_index{ |e, i|  sum += i if e}

p sum
