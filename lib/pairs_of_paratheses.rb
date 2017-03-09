# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
# For example, given n = 3, a solution set is:
# "((()))", "(()())", "(())()", "()(())", "()()()”

 # ["((()))", "(())()", "()()()", "()(())", "()()()"]

# ------------------------------- #

def solve_one(n)
  solutions = []

  str = ''

  # Add simple ()()()
  ["(", ")"].each do |br|
    1.upto(n) do |i|
      str += br
    end
  end

  solutions << str

  counter = n-1

  counter.times do |count|
    str = ''
    # Add n-i
    ["(", ")"].each do |br|
      1.upto(n-(count+1)).each do |i|
        str += br
      end
    end

    # Add the remaining i.
    (count+1).times do |i|
      str += "("
      str += ")"
    end

    solutions << str
  end

  counter.times do |count|
    str = ''

    # Add the remaining i.
    (count+1).times do |i|
      puts "Second #{i}"
      str += "("
      str += ")"
    end

    # Add n-i
    ["(", ")"].each do |br|
      1.upto(n-(count+1)).each do |i|
        puts "First #{i}"
        str += br
      end
    end

    solutions << str
  end

  # (()())
  counter.times do |count|
    str = ''
    str += "("

    # Add n-i
      1.upto(n-(count)).each do |i|
    ["(", ")"].each do |br|
        puts "First #{i}"
        str += br
      end
    end

    str += ")"
    solutions << str
  end

  solutions.uniq
end
