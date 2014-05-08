=begin
Define a method sum which takes an array of integers as an argument and returns the sum of its elements.
For an empty array it should return zero.

Define a method max_2_sum which takes an array of integers as an argument and returns the sum of its two
largest elements. For an empty array it should return zero. For an array with just one element, it should
return that element.

Define a method sum_to_n? which takes an array of integers and an additional integer, n, as arguments and
returns true if any two distinct elements in the array of integers sum to n. An empty array or single element
array should both return false.
=end

def sum(array)
  return 0 if array.empty?
  return array.inject(:+)
end

def max_2_sum(array)
  return 0 if array.empty?
  return array.at(0) if array.length==1
  array.sort!{|x,y| y<=>x}
  return array.at(0)+array.at(1)
end

def sum_to_n?(array,n)
  return false if array.empty?
  return false if array.length==1
  array.each_with_index do |x,i|
    array.each_with_index do |y,j|
     if i!=j
       return true if x+y==n
     end
    end
  end
  return false
end

puts sum []
puts sum [1,3,6,10,15,21]

puts max_2_sum []
puts (max_2_sum [5])==5
puts max_2_sum [1,2,3,5,8,11]

puts sum_to_n?([],15)
puts sum_to_n?([21],26)
puts sum_to_n?([1,4,9,16,25],13)
    