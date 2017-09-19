#what is the index of the first term in the fibonacci sequence to have 1000 digits?

require_relative 'euler_utils'

fib = [1]
a = [0]
b = [1]
i=0

while fib.length < 1000 do

  fib = add_array([a, b])
  b = a
  a = fib
  i+=1
end

p i
