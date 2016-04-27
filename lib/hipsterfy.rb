# Input is a string containing several words.
# Return a string with the last vowel removed from each word.
# 'y' is not a vowel. If a word has no vowels, don't change it.
# For example, hipsterfy("towel flicker banana") => "towl flickr banan"

def hipsterfy(word)
  vowels = %w(a e i o u)
  array = word.to_s.split(//).reverse
  deleted = false

  array.each_with_index do |letter, index|
    break if deleted == true
    if vowels.include?(letter)
      array.delete_at(index)
      deleted = true
    end
  end
  array.reverse.join
end

###+++++++++++++++
