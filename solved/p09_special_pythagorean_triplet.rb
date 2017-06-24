
def is_triplet?(a, b, c)
  a**2 + b **2 == c**2
end

def run
  a = 1

  while a < 1000 do
    b = 1
    while a + b < 1000
      c = 1
      while a + b + c < 1000

        c+=1
        next if a+b+c != 1000
        return [a, b, c] if is_triplet?(a, b, c)

      end
      b+=1
    end
    a+=1
  end
end

p run.reduce(:*)
