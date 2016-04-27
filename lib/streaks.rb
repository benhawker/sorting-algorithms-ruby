# Find the length of streaks within the following array:

# states = [:read, :read, :read, :unread, :unread, :read, :read, :read, :read]
# The array has either :read or :unread, and I want the length of each streak of :read/:unread. For states, this would become:
# streak_lengths = [3, 3, 3, 2, 2, 4, 4, 4, 4]
# The array opens with three :read elements, and we label each of those as being part of a 3 streak, it then has two :unread elements, so they're each labelled with a 2 streak, and then finally we have a streak of four read messages, so they're each labelled with a 4.

def streaks(array)
  result = []
  counter = 1

  array.each_with_index do |element, index|
    if array[index] == array[index + 1]
      counter += 1
    end

    if array[index] != array[index + 1]
      result << [counter] * counter
      counter = 1
    end
    result = result.flatten
    result
  end
end
