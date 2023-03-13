module Enumerable
  # Your code goes here
  def my_each_with_index
    length.times { |i| yield self[i], i if block_given? }
    self
  end

  def my_select
    new_arr = []
    to_a.my_each do |item|
      new_arr.push(item) if yield item if block_given?
    end
    new_arr
  end

  def my_all?
    my_each_with_index do |item, idx|
      result = yield item if block_given?
      return result if result == false || idx == length - 1
    end
  end

  def my_any?
    my_each_with_index do |item, idx|
      result = yield item if block_given?
      return result if result == true || idx == length - 1
    end
  end

  def my_none?
    my_each_with_index do |item, idx|
      result = yield item if block_given?
      return !result if result == true || idx == length - 1
    end
  end

  def my_count
    number_of_matches = []
    to_a.my_each do |item|
      number_of_matches.push(item) if yield item if block_given?
    end
    number_of_matches.length.positive? ? number_of_matches.length : length
  end

  def my_map
    new_arr = []
    to_a.my_each do |item|
      new_arr.push(yield item)
    end
    new_arr
  end

  def my_inject(num)
    sum = num
    my_each_with_index do |item, idx|
      sum += item
      return sum if idx == length - 1
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    length.times { |i| yield self[i] if block_given? }
    self
  end
end
