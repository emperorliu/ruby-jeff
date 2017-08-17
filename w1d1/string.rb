# Implement a Caesar cipher. Example: caesar("hello", 3) # => "khoor"

def caesar(word, num)
  word.chars.map do |letter|
    orig_char = letter.ord
    new_char = orig_char + (num % 26)
    if new_char >= 122
      new_char -= 26
    else
      new_char
    end
    letter = new_char.chr
  end.join
end

# In this exercise, you will define a method num_to_s(num, base), which will return a string representing the original number in a different base (up to base 16).

# num_to_s(5, 10) #=> "5"
# num_to_s(5, 2)  #=> "101"
# num_to_s(5, 16) #=> "5"
# num_to_s(234, 10) #=> "234"
# num_to_s(234, 2)  #=> "11101010"
# num_to_s(234, 16) #=> "EA"


def num_to_s(num, base)
  pow = 0
  hash = ('0'..'9').to_a + ('A'..'F').to_a
  str = ""
  until num / (base ** pow) == 0
    digit = num / (base ** pow) % base
    str << hash[digit]
    pow += 1
  end
  str.reverse
end