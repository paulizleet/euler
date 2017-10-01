# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?



def get_spiral(width)
  spiral = [[0]]
  cursor = [0,0]
  num = 1
  current_width = 0
  loop do

    spiral[cursor[0]][cursor[1]] = num
    num+=1

    case
      when cursor[1] == current_width
        if cursor[0] == current_width
          return spiral if spiral.length >= width
          spiral = pad(spiral)
          current_width = spiral.length - 1
          cursor = right(down(right(cursor)))
        elsif cursor[0] == 0
          cursor=left(cursor)
        else
          cursor = up(cursor)
        end
      when cursor[0] == 0
        if cursor[1] == 0
          cursor = down(cursor)
        else
          cursor = left(cursor)
        end
      when cursor[0] < current_width
        cursor = down(cursor) if cursor[1] == 0
      when cursor[0] == current_width
        cursor = right(cursor) if cursor[1] < current_width
      end

    end

  spiral
end

def pad(spiral)
  i = 0
  while i < spiral.length do
    spiral[i] << 0
    spiral[i].insert(0,0)
    i+=1
  end
  spiral << Array.new(spiral[0].length){0}
  spiral.insert(0, Array.new(spiral[0].length){0})
  spiral
end

def up(cursor)
  return [cursor[0]-1, cursor[1]]
end

def down(cursor)
  return [cursor[0]+1, cursor[1]]
end

def left(cursor)
  return [cursor[0], cursor[1]-1]
end

def right(cursor)
  return [cursor[0], cursor[1]+1]
end

def sum_diagonals(spiral)
  i = 0
  sum = 0
  while i < spiral.length do
    sum += spiral[i][i]
    i+=1
  end

  i = spiral.length - 1
  j=0

  while i >= 0
    sum += spiral[i][j]
    i-=1
    j+=1
  end
  sum - 1 #1 is added twice because it runs over the center two times

end

def elegant_way
  # Build a spiral, then add its diagonals.
  # Slow and complicated, but easier to visualize

  spiral = get_spiral(9)
    spiral.each{|r| p r}
  return sum_diagonals(spiral)
end


def pure_way(width)
  # Fast way using plain math
  # Counts only the corners and every four additions increments the side length by two

  sum = 1
  num = 1

  width += 1 if width % 2 == 0

  ((width - 1) / 2).times do |i|
    4.times do
      num += (i+1) * 2
      sum += num
    end
    i += 2
  end
  sum

end
p elegant_way
p pure_way
