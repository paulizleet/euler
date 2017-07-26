require_relative 'euler_utils'

abundants = {}
nonabundants = []

28124.times do |i|
  next if i < 12
  #Get divisors, add them up, subtract the number itself.
  sum = get_divisors(i).reduce(:+) - (i)

  #If sum of divisors is greater than the number, merge it into the abundant hash
  sum > i ? abundants.merge!({i => sum}) : nil

  #if i minus any key k is also in the abundant hash,return to the top.
  #otherwise, add it to the nonabundant array
  abundants.any?{|k, v| !abundants[(i)-k].nil?} ? next : nonabundants << i
  puts "#{i} can't be written as a sum"

end

# abundants.each_pair{ |k,v|
#   puts "#{k} - #{v}"
#   gets
# }
#abundant numbers are making their way onto the nonabundant list
p nonabundants.reduce(:+)
