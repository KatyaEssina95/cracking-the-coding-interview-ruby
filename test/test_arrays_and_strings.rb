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
end