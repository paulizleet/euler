sieve = Array.new(1000000){true}
i=1
while i < sieve.length

  loop do
    i+=1
    break if sieve[i] == true || i >= sieve.length
  end
  puts "got #{i}"
  j=i*2
  while j < sieve.length
    sieve[j] = false
    j+=i
  end

end

i=0
sieve.each_with_index do |e, j|
  p i
  i+=1 if e == true
  if i == 10001
    p j
    break
  end
end

p i
