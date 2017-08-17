# Ruby provides a class named Set. You can read all about it in the ruby-doc. Let's create a few methods that will manipulate a Hash as if it were a Set.

# set_add_el({}, :x) # => make this return {:x => true}
# set_add_el({:x => true}, :x) # => {:x => true} # This should automatically work if the first method worked
# set_remove_el({:x => true}, :x) # => {}
# set_list_els({:x => true, :y => true}) # => [:x, :y]
# set_member?({:x => true}, :x) # => true
# set_union({:x => true}, {:y => true}) # => {:x => true, :y => true}
# set_intersection # I'm not going to tell you how the last two work
# set_minus # Return all elements of the first hash that are not in the second hash, not vice versa


def set_add_el(set, val)
  if set.empty?
    set[val] = true
  end
  set
end

def set_remove_el(set, val)
  set.delete(val)
  set
end

def set_list_els(set)
  set.keys
end

def set_member?(set, val)
  set.has_key?(val)
end

def set_union(set1, set2)
  set1.merge(set2)
end

def set_intersection(set1, set2)
  set1.keep_if { |key, value| set2.has_key?(key)}
end

def set_minus(set1, set2)
  set1.delete_if { |key, value| set2.has_key?(key) }
end

# Martha has created a hash with letter symbols as keys to represent items that start with their keys. However, she realized everything is off by one letter.

# wrong_hash = { :a => "banana", :b => "cabbage", :c => "dental_floss", :d => "eel_sushi" }
# Write a method correct_hash that takes this wrong hash and returns the correct one.

def correct_this_hash(hash)
  new_hash = {}
  hash.each do |key, value|
    new_hash[value[0].to_sym] = value
  end
  new_hash
end