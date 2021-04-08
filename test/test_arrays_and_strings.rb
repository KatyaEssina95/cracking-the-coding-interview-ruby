require "minitest/autorun"
require_relative '../lib/arrays_and_strings'

class TestArraysAndStrings < Minitest::Test
  def test_all_characters_unique
    unique_chars_string = "abcdefghijk"
    assert string_has_unique_chars? unique_chars_string
    assert string_has_unique_chars_no_structures? unique_chars_string
  end
  
  def test_not_all_characters_unique
    non_unique_chars_string = "aaaaabbbbbbccccccc"
    refute string_has_unique_chars? non_unique_chars_string
    refute string_has_unique_chars_no_structures? non_unique_chars_string
  end

  def test_is_permutation
    str_1 = "abcdefg"
    str_2 = "gfedcba"
    assert is_permutation? str_1, str_2
  end

  def test_is_not_permutation
    str_1 = "aaabbb"
    str_2 = "cccddd"
    refute is_permutation? str_1, str_2
  end

  def test_urlify
    string_with_spaces = " This  string has      spaces"
    url = string_with_spaces.gsub! " ", "%20"
    assert_equal urlify(string_with_spaces), url
  end
end