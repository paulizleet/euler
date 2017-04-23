#paulsort
# A swapping sorting algorithm that behaves like cocktail sort
# but changes directions whenever a swap occurs.
# Worst case is a little bit worse than n^2
# Best case is n
def pprint(list, i)
  str = ""

  list.each_with_index do |a, idx|
    if idx == i
      str += "[#{a}]"
    else
      str += " #{a} "
    end
  end
  puts str
end

def swap(list, i, j)

  swp = list[i]
  list[i] = list[j]
  list[j] = swp
end

def paulsort(list)
  iters = 0
  idx = 1
  direction = 1
  swapped = false
  while idx < list.length  || swapped == true
    iters += 1

    if idx == list.length || idx == 0
      direction *= -1
      idx += direction
      swapped = false if idx == 1

    end

    pprint(list,idx)

    if list[idx] < list[idx-1]
      swap(list, idx, idx-1)
      swapped = true
      direction*=-1
    end

    idx += direction
  end

  p iters
  return list
end

list = [1,0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
#list = (0..20).to_a.shuffle

p paulsort(list)
