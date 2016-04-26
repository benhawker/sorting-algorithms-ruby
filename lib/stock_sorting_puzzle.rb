##Given a single array of real values, each of which represents the stock value of a company
##after an arbitrary period of time, find the best buy price and its corresponding best sell
##price (buy low, sell high).

##To illustrate with an example, let's take the stock ticker of Company Z:

##55.39, 109.23, 48.29, 81.59, 105.53, 94.45, 12.24
##Important to note is the fact that the array is "sorted" temporally -
##i.e. as time passes, values are appended to the right end of the array.
##Thus, our buy value will be (has to be) to the left of our sell value.

##in the above example, the ideal solution is to buy at 48.29 and sell at 105.53


def solve(array)
  array = array.map(&:to_f)

  best_buy = 0
  best_sell = 0
  max_difference = 0

  ##Iterate through the array of stocks - need the index
  array.each_with_index do |element, index|
    ##Store the previous lowest value
    lowest_previous_value = array[0..index].min

    ##Calculate the difference
    max_difference_per_iteration = array[index] - lowest_previous_value

    ##If the max diff for this iteration is greater than than the max_difference set the best buy/sell
    if max_difference_per_iteration > max_difference
      best_buy = lowest_previous_value
      best_sell = array[index]
    end
  end

  puts "Buy at #{best_buy} and sell at #{best_sell}."
end

# array = ["55.39", "109.23", "48.29", "81.59", "105.53", "94.45", "12.24"]


