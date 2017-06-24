
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def divisible?(n)
  (2..19).each do |i|  #We know it's divisible by one,
                       #and since we started with 20, and incremented by 20, it's divisible  by 20
    return false if n % i != 0
  end
  true
end

n = 20
until divisible?(n)
  n+=20 #Increment by 20 because that is the largest multiple we need,
        #and it's way faster than incrementing one at a time
end

p n
