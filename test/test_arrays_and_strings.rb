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

  def test_is_palindrome_permuation
    palindrome_permuation = "taco cat"
    assert palindrome_permutation? palindrome_permuation
  end

  def test_is_not_palindrome_permutation
    not_palindrome_permutation = "another taco cat"
    refute palindrome_permutation? not_palindrome_permutation
  end

  def test_one_away_remove
    string_1 = "pale"
    string_2 = "ple"
    assert one_away? string_1, string_2
  end
  
  def test_one_away_add
    string_1 = "pales"
    string_2 = "pale"
    assert one_away? string_1, string_2
  end
  
  def test_one_away_replace
    string_1 = "pale"
    string_2 = "bale"
    assert one_away? string_1, string_2
  end

  def test_one_away_replace
    string_1 = "pulp"
    string_2 = "gulp"
    assert one_away? string_1, string_2
  end
  
  def test_more_than_one_away
    string_1 = "pale"
    string_2 = "bake"
    refute one_away? string_1, string_2
  end
end