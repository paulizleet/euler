# We shall say that an n-digit number is pandigital if it makes use of all
# the digits 1 to n exactly once; for example, the 5-digit number, 15234,
# is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product
# identity can be written as a 1 through 9 pandigital.

require_relative 'euler_utils'

def return_product_if_this_is_permutation_is_a_pandigital_product(perm)
  prd = (perm[5] * 1000) + (perm[6] * 100) + (perm[7] * 10) + perm[8]

  a = perm[0]
  b = (perm[1] * 1000) + (perm[2] * 100) + (perm[3] * 10) + perm[4]

  return prd if a * b == prd

  a = (perm[0] * 10) + perm[1]
  b = (perm[2] * 100) + (perm[3] * 10) + perm[4]

  return prd if a * b == prd

  0
end

perms = get_permutations((1..9).to_a)
prds = {}
perms.each {|perm| prds.merge!({return_product_if_this_is_permutation_is_a_pandigital_product(perm) => nil})}
sum = 0
prds.reduce(:+)
p sum
