# for i in 1..255
#   puts i
# end

# for i in 1..255
#   unless i % 2 == 0
#     puts i
#   end
# end

# sum = 0
# for i in 1..255
#   puts i, "Sum: #{sum += i}"
# end

# def itr(x)
#   for i in x
#     puts i
#   end
# end
# itr([2,4,6,8,10])

# def max(x)
#   ma = x[0].to_f
#   for i in 0..x.length
#     if x[i].to_f > ma
#       ma = x[i]
#     end
#   end
#   return ma
# end

# def sum(x)
#   su = 0
#   for i in 0..x.length
#     su += x[i].to_f
#   end
#   return su
# end

# def avg(x)
#   return sum(x)/2
# end

# def max_min_avg(x)
#   h = {max: max(x), min: x.min(), avg: avg(x)}
#   return h
# end
x = [2,3,4,5,6,7]
max_min_avg(x)
