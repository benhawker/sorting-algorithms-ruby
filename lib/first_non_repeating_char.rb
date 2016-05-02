# Find the first non repeating character in string.
# Example:
# Input : ADBCGHIEFKJLADTVDERFSWVGHQWCNOPENSMSJWIERTFB
# Output: K

def solve(string)
  hash = {}
  result = 0

  string.chars.each do |char|
   hash[char] = 0
  end

  string.chars.each do |char|
   hash[char] += 1
  end

  hash.key(1)
end