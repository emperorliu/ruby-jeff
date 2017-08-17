# Write a method that takes an array of integers and returns an array with the array elements multiplied by two.

def two_multiplier(arr)
  arr.map { |i| i * 2 }
end

# Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and then returns the original array. Do not use Ruby's Enumerable's each method.

class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call self[i]
    end

    self
  end
end

# Write a method that finds the median of a given array of integers. If the array has an odd number of integers, return the middle item from the sorted array. If the array has an even number of integers, return the average of the middle two items from the sorted array. (This one might not use any enumerable methods?)

def median(arr)
  sorted_arr = arr.sort
  len = sorted_arr.length
  middle_pos = len / 2.0
  len.odd? ? sorted_arr[middle_pos] : (sorted_arr[middle_pos] + sorted_arr[middle_pos + 1]) / 2.0
end

# Create a method that takes in an Array of Strings and uses inject to return the concatenation of the strings.

def string_concat(arr)
  arr.inject { |concat, str| concat + " " + str }
end