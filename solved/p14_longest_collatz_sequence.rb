
def collatz(n)

  return case n % 2
  when 0 then n/2
  when 1 then (3 * n) + 1
  end

end

longest = 0
longest_num = 0
number_hash = {}

1000000.times do |i|
  number_hash.merge!({i => 0})
  d=i
  count = 0
  while d != 1
    d = collatz(d)
    if !number_hash[d].nil?
      count += number_hash[d]
      break
    end
    count += 1
  end
  number_hash[i] = count
  if count > longest
    longest = count
    longest_num = i
  end

end

p longest_num
