#quicksort

def get_pivot(numbers, lo, hi)
  return numbers[hi]
end

def swap(numbers, i, j)
  swp = numbers[i]
  numbers[i] = numbers[j]
  numbers[j] = swp
end

def rearrange(numbers, lo, hi)

  pivot = get_pivot(numbers, lo, hi)

  i = lo - 1
  for j in lo..hi - 1 do
    if numbers[j] < pivot
      i+=1
      swap(numbers, i, j)
    end
  end

  swap(numbers, i+1, hi)
  return i+1

end

def quicksort(numbers, lo, hi)
  return numbers if lo >= hi
  idx = rearrange(numbers, lo, hi)
  quicksort(numbers, lo, idx-1)
  quicksort(numbers, idx, hi)
  numbers
end


def merge(left, right)
  l = 0
  r = 0
  merged = []
  while l < left.length && r < right.length
    if left[l] > right[r]
      merged << right[r]
      r+=1
    else
      merged << left[l]
      l+=1
    end
  end

  while l < left.length
    merged << left[l]
    l += 1
  end

  while r < right.length
    merged << right[r]
    r += 1
  end

  return merged

end

def mergesort(numbers)
  return numbers if numbers.length == 1

  left = mergesort(numbers[0...numbers.length/2])
  right = mergesort(numbers[numbers.length/2..-1])

  return merge(left, right)

end

def radix(nums)
  nums.map!{|n| n.to_s}

  ind = 0
  bucket_again = true

  while bucket_again == true
    ind -= 1
  #  p ind
    bucket_again = false
    buckets = {"0"=>[], "1"=>[], "2"=>[], "3"=>[], "4"=>[], "5"=>[], "6"=>[], "7"=>[], "8"=>[], "9"=>[] }
    nums.each do |n|
      #puts "#{n} - n[#{ind}]: #{n[ind]} -- Is nil? #{n[ind].nil?}"
      if n[ind] == nil
        buckets["0"] << n
      else
        bucket_again = true
        buckets[n[ind]] << n
      end
    end
    nums = []
    buckets.each_value{|v| nums += v}
    #p nums
  end



end

def radix_msd(nums)
  nums.map!{|n| n.to_s}

  ind = -1
  bucket_again = true

  while bucket_again == true
    ind += 1
  #  p ind
    bucket_again = false
    buckets = { "x"=> [], "0"=>[], "1"=>[], "2"=>[], "3"=>[], "4"=>[], "5"=>[], "6"=>[], "7"=>[], "8"=>[], "9"=>[] }
    nums.each do |n|
      #puts "#{n} - n[#{ind}]: #{n[ind]} -- Is nil? #{n[ind].nil?}"
      if n[ind] == nil
        buckets["x"] << n
      else
        bucket_again = true
        buckets[n[ind]] << n
      end
    end
    nums = []
    buckets.each_value{|v| nums += v}
    #p nums
  end

end

def run(opt)
  times = []

  10.times do
    nums = (0..100000).to_a.shuffle

    now = Time.now
    q = nums.dup
    case opt
      when 1 then quicksort(q, 0, nums.length - 1)
      when 2 then mergesort(q)
      when 3 then radix(q)
      when 4 then radix_msd(q)
      when 5 then radix_inplace(q)
    end
    times << Time.now - now

  end


  totaltime = 0
  times.each{|t| totaltime += t}
  return totaltime / times.length
end

nums = (0..10).to_a.shuffle

#

50.times do
  nums = (0..20).to_a.shuffle
  p quicksort(nums, 0, nums.length-1)
end
quicksort_avg = run(1)
puts "Quicksort average: #{quicksort_avg}"
mergesort_avg = run(2)
puts "Mergesort average: #{mergesort_avg}"
radix_avg = run(3)
puts "Radix average: #{radix_avg}"
radixmsd_avg = run(4)
puts "Radix MSD average: #{radixmsd_avg}"
