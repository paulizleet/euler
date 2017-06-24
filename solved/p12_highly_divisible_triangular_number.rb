require_relative 'euler_utils'

triangle_index = 1
triangle = 0

while true
  triangle = triangle_index + triangle
  triangle_index += 1
  p triangle_index
  factors = factorize(triangle)
  p factors.length
  break if factors.length > 500
end

p triangle
