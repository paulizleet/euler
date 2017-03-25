def get_hash
  lycrels = {}

  10000.times {|i| lycrels.merge!({i+1=>0})}

  lycrels

end

def reverse(num)
  num.to_s.reverse.to_i
end

def is_palindrome?(num)
  chars=num.to_s.chars
  chars.each_index do |i|
    return false  if chars[i] != chars[-(i+1)]
    break if i >= chars.length/2
  end
  true
end

def update_lycrels(lycrels, working_hash)
  working_hash.each_key do |k|
    lycrels[k] = true if working_hash[k] < 50 #the problem description says LESS THAN FIFTY!!
    lycrels[k] = false if working_hash[k] >= 50
  end
  lycrels
end

def get_next_candidate(lycrels)
  lycrels.each_key{|k| return k if ![true, false].include?(lycrels[k])}

end

def increment_working_hash(working_hash)
  working_hash.each_key{|k| working_hash[k]+=1}
  working_hash
end

def all_hash_iterations_are_less_than_fifty(working_hash)
  working_hash.each_value{|v| return true if v < 50}
  false
end

def were_done_here(lycrels, working_hash)
  update_lycrels(lycrels, working_hash)
end

def got_a_palindrome(lycrels, working_hash)
  working_hash.each_key{|k| lycrels[k] = true}
  lycrels
end

def check(sum, lycrels)
  #p sum
  working_hash = {}
  working_hash={sum=>0}
  loop do
  #  p sum.to_s[0..100]

    working_hash = increment_working_hash(working_hash)
    sum = sum + reverse(sum)
    if is_palindrome?(sum)
      lycrels = got_a_palindrome(lycrels, working_hash)
      working_hash = {}
    end

    if sum < 10000
      working_hash.merge!({sum=>0})
    end
    break if !all_hash_iterations_are_less_than_fifty(working_hash)
   end

  were_done_here(lycrels, working_hash)
end

lycrels = get_hash

i=0
while i < 10000
  i = get_next_candidate(lycrels)
  lycrels = check(i, lycrels)
end

total = 0

lycrels.each_key do |k|
  p k if !lycrels[k]
  total+=1 if !lycrels[k]
end

p total
