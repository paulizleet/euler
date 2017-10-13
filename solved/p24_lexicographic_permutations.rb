
#find the 1000000th permutation of 0123456789

require_relative 'euler_utils'

# It's slow using my own permutations function
# because it gets all permutations first and picks the 1000000th
p get_permutations((0..9).to_a)[999999]
