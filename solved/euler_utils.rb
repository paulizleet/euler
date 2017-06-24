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
