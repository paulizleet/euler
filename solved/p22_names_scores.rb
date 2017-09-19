require_relative "name_scores_names"

def merge_sort(array)
    return array if array.length == 1
    arr1 = merge_sort(array[0..array.length / 2 -1])
    arr2 = merge_sort(array[array.length / 2..-1])
    merge(arr1, arr2)
end

def merge(arr1, arr2)
  i = 0
  j = 0
  merged = []
  while i < arr1.length && j < arr2.length
    if arr1[i] <= arr2[j]
      merged << arr1[i]
      i+=1
    else
      merged << arr2[j]
      j+=1
    end
  end

  while i < arr1.length
    merged << arr1[i]
    i+=1
  end
  while j < arr2.length
    merged << arr2[j]
    j+=1
  end
  merged
end

def get_score(name)

  sum = 0
  name.chars.each{|c| sum += (c.ord - 64)}
  sum
end

names = merge_sort(get_names)

sum = 0
names.each_with_index {|e, i|  sum += get_score(e) * (i+1)}
p sum
