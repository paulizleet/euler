# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.


def can_be_written?(n)
  save = n
  digs = []
  while n > 0 do
    digs << n % 10
    n -= digs[-1]
    n /= 10
  end
  sum = 0
  digs.each{|i| sum += i**5}

  save == sum
end

max = (9**5) * 4 #Maybe??
sum = 0
max.times do |i|
  next if i < 2
  sum += i if can_be_written?(i)
end

p sum
