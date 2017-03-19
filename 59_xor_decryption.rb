
require_relative "cipher"

CIPHER = ciphertext.split(",").map{|c| c.to_i}
CAPS = ("A".."Z").to_a
SMALLS = ("a".."z").to_a
$probable = 0
def recurse(chars, letters)
  if chars.length == 3
    p chars
    if decrypt(chars) == true
      $probable += 1

    end
    return
  end

  letters.each do |l|
    chars << l
    recurse(chars, letters)
    chars.pop
  end
end

def decrypt(chars)
  #p chars.map{|a| a.chr}
  i = 0

  decrypted_text = []
  while i < CIPHER.length
    case i%3
    when 0 then decrypted_text << (CIPHER[i]^chars[0])
    when 1 then decrypted_text << (CIPHER[i]^chars[1])
    when 2 then decrypted_text << (CIPHER[i]^chars[2])
    else
      (CIPHER[i]^chars[0])
    end

    if ("a".."z").include?(decrypted_text[-1]) || ("A".."Z").include?(decrypted_text[-1])
      return 1 if i == 0
      return i%3
    end
    i+=1
  end

  return check_regexp(decrypted_text)

end


def check_ints(text)
  !text.any?{|e| ((65 > e || e > 90) || (97 > e || e > 122)) && e != 32}
end
def check_regexp(text)

  match = /[^\w]/.match(text.map{|m| m.chr}.join)
  if match != nil
    return false
  end
  puts "got one"
  p text.join
  true
end

def every_third(letters)
  valids = {0 => [], 1 => [], 2 => []}
  3.times do |i|
    for e in letters
      a=0
      tf = true
      while a < CIPHER.length
        break if a+i >= CIPHER.length
        n = (CIPHER[a+i]^e)
        if SMALLS.include?(n.chr) || CAPS.include?(n.chr)
          #puts (CIPHER[a+i]^i).chr
        #  gets.chomp
          tf = false
          break
        end
        a+=3
      end
      valids[i] << e if tf

    end
  end
  p valids
end

def iterate(possibilities)
  narrower = []
  dec = 0
  for first in possibilities[0]
    dec = 0
    for second in possibilities[1]
      dec = 0
      for third in possibilities[2]
        p [first, second, third]
        dec = decrypt([first, second, third])
        case dec
        when 0 then break
        when 1 then break
        when 2 then next
        else narrower << [first, second, third]
        end
      end

      break if dec == 0
    end
  end

end
lowercase_letters = (0..255)

p lowercase_letters.map{|a| a.chr(Encoding::ASCII_8BIT)}

possibilities = every_third(lowercase_letters)
narrowed = iterate(possibilities)
narrowed.each {|r| p r}
p $probable
