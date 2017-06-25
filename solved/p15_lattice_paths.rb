
def fac(n)
  prd = 1
  while n > 0
    prd *= n
    n-=1
  end
  prd
end

def ncr(n, r)
  return 1 if r==0
  return (fac(n)) / (fac(r) * fac(n-r))
end

row = [1]
r = 40
(r+1).times do |i|
  next if i == 0
  puts "#{r} choose #{i} = #{ncr(r, i)}"
  puts "But this formula gives me #{ncr(r, i-1) * (((r + 1) - i) / i)}\n\n"
  row << (ncr(r, i-1)) * (((r + 1) - i) / i)
end

p row

p ncr(40, 38)
p ncr(40, 2)
p ncr(40, 20)
