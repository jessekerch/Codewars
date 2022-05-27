#Jesse Kercheval
#May 24, 2022

def persistence(n)
  return 0 if n < 10
  1 + persistence(n.digits.reduce(&:*))
end

num = 999
p num