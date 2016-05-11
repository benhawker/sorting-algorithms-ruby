# Write a function that takes a string as input and reverse only the vowels of a string.

# Example 1:
# Given s = "hello", return "holle".

# Example 2:
# Given s = "leetcode", return "leotcede".


def solve(string)
  array = string.chars
  vowels = %w(a e i o u)
  vowels_in_word = []

  array.each { |char| vowels_in_word << char if vowels.include?(char) }
  array.map!{|char| vowels.include?(char) ? vowels_in_word.pop : char }
end