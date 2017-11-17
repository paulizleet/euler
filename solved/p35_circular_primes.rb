

require_relative 'euler_utils'

sieve = prime_sieve(1000000)

circles = 0

sieve.each_with_index do |i, n|
  next if i == false
  original = n.to_s.chars
  rotated = original.rotate
  is_circle = true
  original.length.times do
    break if is_circle == false
    is_circle = false if sieve[rotated.join.to_i] != true
    rotated.rotate!
  end

  circles += 1 if is_circle == true
  
end

puts circles
