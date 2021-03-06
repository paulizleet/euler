#A group math functions that I use often while solving project euler problems

def factorial(n)
  return 1 if n <= 1
  n * factorial(n-1)
end

def prime_sieve(n)

  sieve = Array.new(n){true}

  i=1
  sieve[0] = false
  sieve[1] = false
  while i < sieve.length

    loop do
      i+=1
      break if sieve[i] == true || i >= sieve.length
    end
    j=i*2
    while j < sieve.length
      sieve[j] = false
      j+=i
    end

  end

  sieve
end

def is_prime?(n)
  stop = (n ** 0.5).floor
  i = 2
  while i < stop do
    return false if n % i == 0
    i+=1
  end
  true
end

def factorize(n)
  i = 1
  factors = []
  until n < i do

    if n % i == 0
      factors += [i, n/i]
      n = n/i
    end
    i+=1
  end
  #factors.uniq
  factors
end

def get_divisors(n)
  divs = []
  i=1
  while i < n ** 0.5

    if n % i == 0
      divs << i
      divs << n / i
    end
    i+=1
  end

  divs.empty? ? [1, n] : divs
end

def add_array(numbers)
  #adds an array of numbers themselves separated into arrays of their digits
  sum = []

  #depends on having all digit arrays be the same length
  longest = 0
  numbers.each {|i| i.length > longest ? longest = i.length : nil} #find longest
  numbers.each_index {|i| numbers[i].insert(0,0) while numbers[i].length < longest} #pad all shorter numbers with zeroes


  i = numbers[0].length - 1
  carry = 0
  sum = []
  while i >= 0 do
    total = 0
    numbers.each do |n|
      next if n[i].nil?
      total += n[i]
    end
    total += carry
    carry = total / 10
    sum.insert(0, total % 10)
    i-=1
  end
  sum.insert(0, carry % 10) if carry != 0
  sum.insert(0, carry / 10) if carry / 10 != 0

  sum

end

def multiply(a, b)
  product = [0]
  carry = 0
  i = -1
  while !b[i].nil?
    j = -1
    temp_prd = Array.new((i*-1)-1){0}
    while !a[j].nil?
      temp_prd.insert(0, ((b[i]*a[j])+carry) % 10)
      carry = ((b[i]*a[j])+carry) / 10
      j-=1
    end
    temp_prd.insert(0, carry % 10)
    temp_prd.insert(0, carry / 10)
    product = add_array([temp_prd, product])
    i-=1
  end
  product
end

def get_digits(n)
  digs = []
  while n > 0 do
    digs << n % 10
    n -= digs[-1]
    n /= 10
  end
  digs
end

def get_permutations(list, seq=[])
  if list == []
    return [seq]
  end
  perm_list = []
  list.each_with_index do |e, i|
    perm_list += get_permutations(list - [e], seq + [list[i]])
  end

  perm_list
end
