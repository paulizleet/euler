#What is the sum of the digits that make up 2**1000?
require_relative 'euler_utils'

#Fast ruby screwery
p (2**1000).to_s.chars.map{|e| e.to_i(10)}.reduce(:+)

#the thoughtful, extendable way
a = [2]
prd = [1]
1000.times {prd = multiply(prd, [2])}
p prd.reduce(:+)
