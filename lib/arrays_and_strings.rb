def string_has_unique_chars?(test_string)
  # use a hash to keep track of seen chars
  seen_chars = {}
  test_string.chars.each do |char|
    if seen_chars.key? char
      return false
    else
      seen_chars[char] = char
    end
  end
  true
end

def string_has_unique_chars_no_structures?(test_string)
  # 2 pointers - 1 current letter & one checking the rest of the string
  current_index = 0
  compare_index = 1
  while current_index < test_string.length - 1 do
    current_letter = test_string[current_index]
    while compare_index < test_string.length do
      if test_string[compare_index] == test_string[current_index]
        return false
      end
      compare_index += 1
    end
    current_index += 1
    compare_index = current_index + 1
  end
  true
end