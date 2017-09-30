# Find the product of the coefficients, aa and bb, for the quadratic
# expression that produces the maximum number of primes for consecutive
# values of nn, starting with n=0n=0.
#
# Considering quadratics of the form:
#
# n^2+an+b, where |a|< 1000  and |b|≤1000
#
# where |n||n| is the modulus/absolute value of n

# I found two ways to solve this, each with minor tradeoffs from each other
#   1.  Build a prime sieve big enough to have all possible numbers that
#       So you don't need to check every number you get.
#       This is less space effiencnt, but is faster even with the time it
#       takes to build the sieve in the first place
#
#   2.  Brute force check all of the numbers for their prime-ness
#       Doesn't use as much space, but is slower overall


require_relative 'euler_utils'

def quadratic(n, a, b)
  return n**2 + (a*n) + b
end

def check_with_sieve(a, b, sieve, longest)
  seq = 0
  loop do
    x = quadratic(seq, a, b)
    break if x < 0 || sieve[x] == false
    seq += 1
  end

  longest = [seq, a*b] if seq > longest[0]

  return longest
end

def check_without_sieve(a, b, longest)
  seq = 0
  loop do
    x = quadratic(seq, a, b)
    break if x < 0 || !is_prime?(x)
    seq += 1
  end

  longest = [seq, a*b] if seq > longest[0]

  return longest
end

def sieve_method
  sieve = prime_sieve(1000000)
  longest = [0,0]
  a = -1000
  while a < 1000
    b = -1000
    while b < 1000
      longest = check(a, b, sieve, longest)
      b+=1
    end
    a+=1
  end
  return longest
end

def check_primes_method
  longest = [0,0]
  a = -1000
  while a < 1000
    b = -1000
    while b < 1000
      longest = check(a, b, longest)
      b+=1
    end
    a+=1
  end
  return longest
end
