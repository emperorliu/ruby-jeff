# Write your own uniq method, called my_uniq; it should take in an Array and return a new array.
# [1, 1, 3, 4, 4, 5].my_uniq => [1, 3, 4, 5]

# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]

class Array
  def my_uniq
    arr = []
    self.each { |num| arr << num if !arr.include?(num) }
    p arr
  end

  def two_sum
    arr = []
    (0..self.length - 1).each do |i|
      second_pos = i + 1
      (second_pos..self.length - 1).each do |j|
        if self[i] + self[j] == 0
          arr << [i, j]
        end
      end
    end
    p arr
  end
end

# Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake. Usage will look like the following:

# my_transpose([
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]

def my_transpose(arr)
  new_arr = []
  while arr.first.count != 0
    col = []
    arr.each do |row|
      col << row.shift
    end
    new_arr << col
  end
  p new_arr
end

# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days on which to first buy the stock and then sell the stock.


def stock_picker(prices)
  best_buy = nil
  best_sell = nil
  max_profit = 0

  (0..(prices.length - 2)).each do |buy_date|
    ((buy_date + 1)..prices.length - 1).each do |sell_date|
      price_difference = prices[sell_date] - prices[buy_date]
      if price_difference > max_profit
        best_buy = buy_date
        best_sell = sell_date
        max_profit = price_difference
      end
    end
  end

  puts "day #{best_buy}: buy at #{prices[best_buy]}"
  puts "day #{best_sell}: sell at #{prices[best_sell]}"
  puts "profit of #{max_profit}"
end