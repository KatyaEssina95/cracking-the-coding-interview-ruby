#1.1
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
  # alternative solution - sort & check neighbour
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

#1.2
def is_permutation?(str_1, str_2)
  if str_1.length != str_2.length
    return false
  end

  str_1.chars.sort == str_2.chars.sort
end

#1.3
def urlify(string_with_spaces)
  # add enough spaces to an array at the end
  # loop backwards and replace chars to not overwrite
  number_of_spaces = string_with_spaces.count ' '
  string_array = string_with_spaces.chars
  new_index = string_with_spaces.length - 1 + 2*number_of_spaces
  old_index = string_with_spaces.length - 1
  while new_index >= 0 do
    if string_array[old_index] == " "
      string_array[new_index] = "0"
      string_array[new_index-1] = "2"
      string_array[new_index-2] = "%"
      new_index -= 3
    else
      string_array[new_index] = string_array[old_index]
      new_index -= 1
    end
    old_index -= 1
  end
  string_array.join
end

#1.4
def palindrome_permutation?(test_string)
  # hash
  # all should be even
  # there should be no more than 1 letter of odd freq
  chars_hash = {}
  odd_count = 0
  test_string.downcase.gsub(/\s+/, "").each_char do |char|
    if chars_hash.has_key? char
      chars_hash[char] += 1
    else
      chars_hash[char] = 1
    end

    if chars_hash[char] % 2 == 0
      odd_count -= 1
    else
      odd_count += 1
    end
  end
  odd_count <= 1
end

#1.5
def one_away?(string_1, string_2)
  if (string_1.length - string_2.length).abs > 1
    return false
  end

  if string_1.length >= string_2.length
    long_string = string_1
    short_string = string_2
  else
    long_string = string_2
    short_string = string_1
  end

  difference = 0
  long_pointer = 0
  short_pointer = 0

  while short_pointer < short_string.length do
    if long_string[long_pointer] == short_string[short_pointer]
      long_pointer += 1
      short_pointer += 1
    elsif long_string.length == short_string.length
      difference += 1
      long_pointer += 1
      short_pointer += 1
    else
      difference += 1
      long_pointer += 1
    end
  end
  difference <= 1
end
