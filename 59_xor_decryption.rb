
require_relative "cipher"

CIPHER = ciphertext.split(",").map{|c| c.to_i}
cipher = CIPHER.dup
zip = cipher.zip(CIPHER.map{|c| c.chr})
zip.each{|r| p r}
$probable = 0
def recurse(chars, letters)
  if chars.length == 3
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
    i+=1
  end

  return check_regexp(decrypted_text)

end


def check_ints(text)
  !text.any?{|e| ((65 > e || e > 90) || (97 > e || e > 122)) && e != 32}
end
def check_regexp(text)
  #puts text.join
#s  gets.chomp

  match = /[^\w]/.match(text.map{|m| m.chr}.join)
  if match != nil
    return false
  end
  puts "got one"
  p text.join
  true
end


lowercase_letters = (97..122).to_a

p lowercase_letters.map{|a| a.chr(Encoding::ASCII_8BIT)}

recurse([], lowercase_letters)
p $probable
