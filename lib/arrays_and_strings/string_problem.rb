class StringProblem
  # 1.1
  def has_unique_chars?(string)
    # use a hash to keep track of seen chars
    seen_chars = {}
    string.chars.each do |char|
      if seen_chars.key? char
        return false
      else
        seen_chars[char] = char
      end
    end
    true
  end

  def has_unique_chars_no_structures?(string)
    # 2 pointers - 1 current letter & one checking the rest of the string
    # alternative solution - sort & check neighbour
    current_index = 0
    compare_index = 1
    while current_index < string.length - 1 do
      while compare_index < string.length do
        if string[compare_index] == string[current_index]
          return false
        end
        compare_index += 1
      end
      current_index += 1
      compare_index = current_index + 1
    end
    true
  end

  # 1.2
  def is_permutation?(string_1, string_2)
    if string_1.length != string_2.length
      return false
    end

    string_1.chars.sort == string_2.chars.sort
  end

  # 1.3
  def urlify(string_with_spaces)
    # Need to replace all spaces in string with %20
    # Strategy: add enough spaces to an array at the end
    # Iterate backwards and replace chars to not overwrite
    number_of_spaces = string_with_spaces.count " "
    string_array = string_with_spaces.chars
    new_index = string_with_spaces.length - 1 + 2 * number_of_spaces
    old_index = string_with_spaces.length - 1
    while new_index >= 0 do
      if string_array[old_index] == " "
        string_array[new_index] = "0"
        string_array[new_index - 1] = "2"
        string_array[new_index - 2] = "%"
        new_index -= 3
      else
        string_array[new_index] = string_array[old_index]
        new_index -= 1
      end
      old_index -= 1
    end
    string_array.join
  end

  # 1.4
  def is_palindrome?(string)
    # Example: obo, bollob
    string = string.downcase.gsub(/\s+/, "")
    front_pointer = 0
    end_pointer = string.length - 1
    mid_point = (end_pointer / 2).floor # Don't count middle odd character

    while front_pointer <= mid_point
      if string[front_pointer] == string[end_pointer]
        front_pointer += 1
        end_pointer -= 1
      else
        return false
      end
    end
    true
  end

  # 1.5
  def is_one_away?(string_1, string_2)
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

  # 1.6
  def compress_string(string_to_compress)
    output_array = []
    pointer = 0
    while pointer < string_to_compress.length do
      current_letter = string_to_compress[pointer]
      letter_count = 0
      while string_to_compress[pointer] == current_letter && pointer < string_to_compress.length  do
        letter_count += 1
        pointer += 1
      end
      output_array << current_letter
      output_array << letter_count

      if output_array.length > string_to_compress.length
        return string_to_compress
      end
    end
    return output_array.join
  end
end
