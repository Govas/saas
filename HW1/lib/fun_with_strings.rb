module FunWithStrings
  def palindrome?
    selfie=self.gsub(/\W/,'').downcase
    return (selfie==selfie.reverse)? true:false
  end
  def count_words
    selfie=self.gsub(/[^\w\s]/,'').downcase
        words=selfie.split(' ')
        counted=Hash.new
        words.each do |w|
          if counted.include?(w)
            counted[w]+=1
          else
            counted[w]=1
          end
        end
        return counted
  end
  def anagram_groups
    anagrams=Array.new
        words=self.split(' ')
        words.each do |x|
            ary=Array.new
            ax=x.downcase.split('').sort
            words.each do |y|
              ay=y.downcase.split('').sort
              if ax==ay
                unless anagrams.include_element?(y)
                   ary<<y
                end
              end
            end
            anagrams<<ary unless ary.empty?
        end
      return anagrams
  end
end

class Array
  def include_element?(n)
    self.each{|x| x.each{|y| return true if y.include?(n)}}
    return false
  end
end
# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
