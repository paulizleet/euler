
def bouncy?(n)
  digits = n.to_s.chars.map{|d| d.to_i}
  return false if digits.length < 3
  !(increasing?(digits) || decreasing?(digits))
end

def increasing?(digits)
  i=1
  while i < digits.length
    return false if digits[i] < digits[i-1]
    i+=1
  end
  true
end

def decreasing?(digits)
  i=1
  while i < digits.length
    return false if digits[i] > digits[i-1]
    i+=1
  end
  true
end

def main

  ninety_nine_percent = 1 - (1.0/100)

  num_bouncy = 0.0
  i=1
  loop do
    i+=1
    if bouncy?(i)
      num_bouncy+=1
    end

    break if num_bouncy / i == 0.99
  end

  p num_bouncy / i
  p num_bouncy
  p i
end

main
