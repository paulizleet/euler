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
  divs
end

def add_array(numbers)
  sum = []

  i = numbers[0].length - 1
  carry = 0
  sum = []
  while i >= 0 do
    total = 0
    numbers.each do |n|
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
