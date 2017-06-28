#What is the sum of the digits that make up 2**1000?
require_relative 'euler_utils'

def multiply(a, b)
  product = [0]
  carry = 0
  i = -1
  while !b[i].nil?
    j = -1
    temp_prd = Array.new((i*-1)-1){0}
    while !a[j].nil?
      temp_prd.insert(0, ((b[i]*a[j])+carry) % 10)
      carry = ((b[i]*a[j])+carry) / 10
      j-=1
    end
    temp_prd.insert(0, carry % 10)
    temp_prd.insert(0, carry / 10)
    product = add_array([temp_prd, product])
    i-=1
  end
  product
end

#Fast ruby screwery
p (2**1000).to_s.chars.map{|e| e.to_i(10)}.reduce(:+)

#the thoughtful, extendable way
a = [2]
prd = [1]
1000.times {prd = multiply(prd, [2])}
p prd.reduce(:+)
