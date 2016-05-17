# array = ["This", "is", "an", "example", "of", "text", "justification."]
# array = ["justification", "This", "is", "an", "example", "of", "text."]
# array = ["justification", "This", "is", "an", "example", "of", "text.", "justification", "This", "is", "an", "example", "of", "text."]
# array = %w(Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.)

## To be completed
## Has nasty side effect of modifying the original array.
## Failing on some larger sentences where num_of_chars_to_fill < num_of_spaces & we calculate zero
def justify(array, max_length=16)
  words_per_line = 0
  character_count = 0
  per_line = []

  array.each_with_index do |word, index|
    if (character_count + word.length) > max_length
      per_line << words_per_line
      character_count = 0
      words_per_line = 0
    end
    character_count += word.length + 1
    words_per_line += 1
  end

  per_line << array.size - per_line.inject(:+) if (array.size - per_line.inject(:+)) != 1

  result = []
  number_of_lines = per_line.size

  0.upto(number_of_lines - 1) do |i|
    line = array.first(per_line[i])
    array = array.drop(per_line[i])

    num_of_chars = line.join(" ").size
    num_of_chars_to_fill = max_length - num_of_chars
    num_of_words = per_line[i]
    num_of_words == 1 ? num_of_spaces = 1 : num_of_spaces = (num_of_words - 1)

    if num_of_chars_to_fill % num_of_spaces == 0
      0.upto(num_of_spaces-1) do |space|
        line[space] << " " * (num_of_chars_to_fill/num_of_spaces)
        ##will only occur when number of chars to fill is less than the num of spaces.
        if num_of_chars_to_fill > 0 && num_of_chars_to_fill/num_of_spaces == 0
          ## Add the num_of_chars_to_fill to the most lefterly spaces.
          count = 0
          until count == num_of_chars_to_fill
            line[count] << " "
            count += 1
          end
        end
      end
    elsif num_of_chars_to_fill % num_of_spaces != 0
      if num_of_chars_to_fill == 1
        line[0] << " "
      elsif num_of_chars_to_fill > 1
        0.upto(num_of_spaces-1) do |space|
          line[space] << " " * (num_of_chars_to_fill/num_of_spaces)
          line[0] << " "
          if num_of_chars_to_fill > 0 && num_of_chars_to_fill/num_of_spaces == 0
          ## Add the num_of_chars_to_fill to the most lefterly spaces.
          ## Count == as we have already placed one.
            count = 1
            until count == num_of_chars_to_fill
              line[count] << " "
              count += 1
            end
          end
        end
      end
    end
    line = line.join(" ")
    result << line
  end

  unless array.empty?
    last_line = array[0] + (" " * (max_length - array[0].size))
    result << last_line
  end

  puts result
end