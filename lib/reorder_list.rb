# Given a singly linked list L: L0→L1→…→Ln-1→Ln,
# reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
# You must do this in-place without altering the nodes' values.
# For example,
# Given {1,2,3,4}, reorder it to {1,4,2,3}.

# Proposed solution: Reverse the back half first, then reorder.
def reorder(array)
  slice = array.slice(array.size/2 ,array.size).reverse
  tmp = array[0]

  array.map do |element|
    if (array.index(element)).odd?
      tmp = element unless array.index(element) == 0
      element = slice.shift
    else
      element = tmp
    end
  end
end