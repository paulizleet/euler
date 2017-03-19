
require_relative "cipher"

CIPHER = ciphertext.split(",").map{|c| c.to_i}

$probable = 0
$probables = []

def recurse(chars, letters)
  if chars.length == 3
    if check_regexp(decrypt(chars)) == true
      $probable += 1
      $probables << chars.dup
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
  return decrypted_text
end

def check_regexp(text)
  #Wikipedia says 'because' is the 94th most common word in the english language.
  #Also, it's very long so the likelyhood of it showing up randomly is very slim
  match = /because/.match(text.map{|m| m.chr}.join)
  return false if match == nil
  true
end


lowercase_letters = (97..122)

recurse([], lowercase_letters)

$probables.each do |key|
  p key.map{|a| a.chr}
  decrypted_text = decrypt(key)
  puts decrypted_text.map{|m| m.chr}.join
  puts decrypted_text.reduce(:+)
end
p $probable
