# Given an array of words and a length L, format the text such that each line has
# exactly L characters and is fully (left and right) justified.
# You should pack your words in a greedy approach; that is, pack as many words as you can in each line.
# Pad extra spaces ' ' when necessary so that each line has exactly L characters.
# Extra spaces between words should be distributed as evenly as possible.
# If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
# For the last line of text, it should be left justified and no extra space is inserted between words.
# For example,
# words: ["This", "is", "an", "example", "of", "text", "justification."]
# L: 16.
# Return the formatted lines as:
# [
#    "This    is    an",
#    "example  of text",
#    "justification.  "
# ]
# Note: Each word is guaranteed not to exceed L in length.

## array = ["This", "is", "an", "example", "of", "text", "justification."]
## Seems to be a valid solution (if overly complex - there must be an easier way!) To be refactored into a few methods.
class Justifier
  attr_reader :array, :max_length

  def intialize(array, max_length)
    @array = array
    @max_length = max_length
  end

  def justify(array)
    character_count = 0
    per_line = []

    ## Iterate through the words array and store how many words we can fit on each line.
    array.each_with_index do |word, index|
      if (character_count + word.length) > max_length
        ## This will give the number of words per line. Absolute for 1st line, then arr[1]-arr[0] etc.
        #per_line << index
        per_line[-1] != nil ? per_line << index - per_line[-1] : per_line << index
        ## Reset the counts.
        character_count = 0
        words_per_line = 0
      end
      ##The +1 accounts for a space after each word. May need to deal with the last word.
      character_count += word.length + 1
    end
    ## per_line returns [3, 6] ##ignores the last line - this is a special case.

    ## We'll need an array to store the result.
    result = []

    ##++++++++++And building in the lines approach++++++++++##
    number_of_lines = per_line.size ##Excludes the last - this is a special case
    # lines = []

    0.upto(number_of_lines - 1) do |i|
      ##Get the line we will deal with.
      line = array.first(per_line[i])
      ##Then drop those from the original arr
      array = array.drop(per_line[i])

      #Setup the line
      #line = []
      ##Capture key info on the line
      #line = array.first(per_line[0])
      num_of_chars = line.join(" ").size
      num_of_chars_to_fill = max_length - num_of_chars
      num_of_words = per_line[0]
      num_of_spaces = num_of_words - 1

      if num_of_chars_to_fill % num_of_spaces == 0
        0.upto(num_of_spaces-1) do |space|
          line[space] << " " * (num_of_chars_to_fill/num_of_spaces)
        end
      elsif num_of_chars_to_fill % num_of_spaces != 0
        0.upto(num_of_spaces-1) do |space|
          line[space] << " " * (num_of_chars_to_fill/num_of_spaces) ##zero for the second line.
          line[0] << " " ##if it's odd and fits we can fit one more. Perhaps requires an unless num_of_chars > 16/17?
        end
      end
      ## Lastly add the extra spaces we counted previously in #num_of_chars = line.join(" ").size and add the result array.
      line = line.join(" ")
      result << line
    end

    ## ++++++++ ##

    ## array now contains only the last line.
    last_line = array[0] + (" " * (max_length - array[0].size))
    result << last_line
    ## ["This    is    an", "example of text", "justification.  "]
    #now to add the line breaks.
    result.each { |line| line << "\n" }
    ## and puts the result to keep correct formatting.
    puts result
  end
