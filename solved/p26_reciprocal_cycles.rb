
#Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

#Use long division of decimals
#Once we have a remainder we've gotten previously, our cycle is complete

i = 2
longest = [0,0]
while i < 1000 do
  count = 0
  rem = 1
  remainders = {}
  loop do

    quotient = rem / i
    to_sub = quotient * i
    rem = rem - to_sub
    break if !remainders[rem].nil?
    remainders.merge!({rem => -1})
    rem *= 10
    count += 1
  end

  longest = [i, count] if count > longest[1]
  i+=1

end

p longest
