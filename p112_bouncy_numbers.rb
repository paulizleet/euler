
def bouncy?(n)
  digits = n.to_s.chars.map{|d| d.to_i}
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


  num_bouncy = 0.0
  i=1.0
  loop do
    i+=1
    if bouncy?(i)
      num_bouncy+=1
    end

    break if num_bouncy / i >= 0.99000000000000000
  end

  p num_bouncy / i
  p num_bouncy
  p i
end

main
