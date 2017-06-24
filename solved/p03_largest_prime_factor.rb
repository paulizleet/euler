require_relative "euler_utils"

def is_prime?(x)
  return false if x % 2 == 0
  i = x ** 1/2
  j = 3
  while j < i do
    if x % j == 0
      return false
    end
    j+=2
  end
  true
end


n = 76576500
p factorize(n)
p factorize(n).map{|i| is_prime?(i) ? i : 0}.max
