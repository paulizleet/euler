
require_relative 'euler_utils'
prd = [1]
100.times{|i| prd=multiply(prd, [i+1])}
p add_array([prd, [0]]).reduce(:+)
