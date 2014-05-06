=begin
Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.

Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. 
(For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and lower case and 
for nonletters!

Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number that is a 
multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number!
=end
def hello(name)
  "Hello, " + name
end

def starts_with_consonant?(s)
  s.downcase!
  return (/\A[aeiou]/=~ s)? true:false
end

def binary_multiple_of_4?(s) 
  return false unless /^[0-1]+$/=~s
  return s.to_i(2)%4==0? true:false
end
puts hello("Govs")
puts starts_with_consonant?("Arturo")
puts starts_with_consonant?("Govea")
puts binary_multiple_of_4?("52613")
puts binary_multiple_of_4?("advklk6132")
puts binary_multiple_of_4?("1010101010")
puts binary_multiple_of_4?("1000")


