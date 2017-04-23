

def swap(list, i, j)
  swp = list[i]
  list[i] = list[j]
  list[j] = swp
end

def paulsort(list)
  idx = 1
  direction = 1
  swapped = false
  while idx < list.length  || swapped == true

    swapped = false if idx == 1

    if idx == list.length
      direction *= -1
      idx -= 1
    end
    if idx == 0
      direction *= -  1
      idx += 1
    end

    if list[idx] < list[idx-1]
      swap(list, idx, idx-1)
      swapped = true
      direction*=-1
    end

    idx += direction
  end


  return list
end


def bubble(list)
  done = false
  while done == false
    done = true

    i=1
    while i < list.length
      if list[i] < list[i-1]
        swap(list, i, i-1)
        done = false
      end
      i+=1
    end
  end
end
#nums = [2, 9, 0, 6, 5, 8, 7, 4, 1, 10, 3]


def run(opt)
  times = []

  10.times do
    nums = (0..1000).to_a.shuffle

    now = Time.now
    q = nums.dup
    case opt
      when 1 then bubble(q)
      when 2 then paulsort(q)
    end
    times << Time.now - now
    p q[0..20]

  end


  totaltime = 0
  times.each{|t| totaltime += t}
  return totaltime / times.length
end

bubblesort_avg = run(1)
puts "bubblesort average: #{bubblesort_avg}"
paulsort_avg = run(2)
puts "Paulsort average: #{paulsort_avg}"
