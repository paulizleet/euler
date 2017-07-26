#A group math functions that I use often while solving project euler problems

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
  sum = []

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
  sum.insert(0, carry % 10)
  sum.insert(0, carry / 10)

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
