
# digits = {
#           1 => 3,
#           2 => 3,
#           3 => 5,
#           4 => 4,
#           5 => 4,
#           6 => 3,
#           7=> 5,
#           8 => 5,
#           9 => 4
#           }
#
# tens = {  0=> 0,
#           1 => {0 => 3,
#                 1 => 6,
#                 2 => 6,
#                 3 => 8,
#                 4 => 8,
#                 5 => 7,
#                 6 => 7,
#                 7 => 9,
#                 8 => 8,
#                 9 => 8},
#           2 => 6,
#           3 => 6,
#           4 => 5,
#           5 => 5,
#           6 => 5,
#           7 => 7,
#           8 => 6,
#           9 => 6}

#
# hundred = 7
# thousand = 8

digits = {1 => "one",
        2=> "two",
        3=> "three",
        4=> "four",
        5=> "five",
        6 => "six",
        7 => "seven",
        8 => "eight",
        9 => "nine"}

tens = {0 =>"",
      1 => {0=> "ten",
            1 =>"eleven",
            2 => "twelve",
            3 => "thirteen",
            4 => "fourteen",
            5 => "fifteen",
            6 => "sixteen",
            7 => "seventeen",
            8 => "eighteen",
            9 => "nineteen"},
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"}

hundred = "hundred"
thousand = "thousand"

sum = 0

# sum = 0
1000.times do |i|
  running = ""
  num = i + 1
  running += digits[num/100] + hundred if !digits[num/100].nil?
  num -= (num / 100) * 100

  if num != 0
    running += "and" if running != ""

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
  puts "#{i+1} - #{running} - #{running.length}"
  sum += running.length

end
p sum + "onethousand".length
