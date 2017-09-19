
digits = {
          1 => 3,
          2 => 3,
          3 => 5,
          4 => 4,
          5 => 4,
          6 => 3,
          7=> 5,
          8 => 5,
          9 => 4
          }

tens = {  0=> 0,
          1 => {0 => 3,
                1 => 6,
                2 => 6,
                3 => 8,
                4 => 8,
                5 => 7,
                6 => 7,
                7 => 9,
                8 => 8,
                9 => 8},
          2 => 6,
          3 => 6,
          4 => 5,
          5 => 5,
          6 => 5,
          7 => 7,
          8 => 6,
          9 => 6}


hundred = 7
thousand = 8
sum = 0

# sum = 0
1000.times do |i|
  running = 0
  num = i + 1
  running += digits[num/100] + hundred if !digits[num/100].nil?
  num -= (num / 100) * 100

  if num != 0
    running += 3 if running != 0

    if num/10 == 1
      running += tens[1][num % 10]
      num = 0
    else
      running += tens[num / 10]
      num -= (num / 10) * 10
    end

  end

  if num != 0
    running += digits[num]
  end
  puts "#{i+1} - #{running}"
  sum += running

end
p sum +"onethousand".length
