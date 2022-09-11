require_relative "../test_helper"
require "arrays_and_strings/string_problem"

class StringsTest < Minitest::Test
  def setup
    @problem = StringProblem.new
  end

  def test_has_unique_chars_is_true
    string = "abcdefghijk"

    assert @problem.has_unique_chars?(string)
    assert @problem.has_unique_chars_no_structures?(string)
  end

  def test_has_unique_chars_is_false
    string = "aaaaabbbbbbccccccc"

    refute @problem.has_unique_chars?(string)
    refute @problem.has_unique_chars_no_structures?(string)
  end

  def test_is_permutation_is_true
    string = "abcdefg"
    permutation = "gfedcba"

    assert @problem.is_permutation? string, permutation
  end

  def test_is_permutation_is_false
    string = "aaabbb"
    permutation = "cccddd"

    refute @problem.is_permutation? string, permutation
  end

  def test_urlify
    string = " This  string has      spaces"

    assert_equal string.gsub!(" ", "%20"), @problem.urlify(string)
  end

  def test_urlify_no_spaces
    string = "string"

    assert_equal string, @problem.urlify(string)
  end

  def test_is_palindrome_is_true
    palindrome = "taco cat"

    assert @problem.is_palindrome? palindrome
  end

  def test_is_palindrome_is_false
    not_palindrome = "another taco cat"

    refute @problem.is_palindrome? not_palindrome
  end

  def test_is_one_away_remove
    string_1 = "pale"
    string_2 = "ple"

    assert @problem.is_one_away? string_1, string_2
  end

  def test_is_one_away_add
    string_1 = "pales"
    string_2 = "pale"

    assert @problem.is_one_away? string_1, string_2
  end

  def test_is_one_away_replace
    string_1 = "pale"
    string_2 = "bale"

    assert @problem.is_one_away? string_1, string_2
  end

  def test_is_than_one_away_is_false
    string_1 = "pale"
    string_2 = "bake"

    refute @problem.is_one_away? string_1, string_2
  end

  def test_compress_string_shorter
    string_to_compress = "aabcccccaaaa"
    compressed_string = "a2b1c5a4"

    assert_equal compressed_string, @problem.compress_string(string_to_compress)
  end

  def test_compress_string_longer
    string_to_compress = "abcda"
    assert_equal string_to_compress, @problem.compress_string(string_to_compress)
  end

  def test_rotate_matrix_even
    matrix = [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16]
    ]

    rotated_matrix = [
      [13, 9, 5, 1],
      [14, 10, 6, 2],
      [15, 11, 7, 3],
      [16, 12, 8, 4]
    ]
    assert_equal rotated_matrix, @problem.rotate_matrix(matrix)
  end

  def test_rotate_matrix_odd
    matrix = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    rotated_matrix = [
      [7, 4, 1],
      [8, 5, 2],
      [9, 6, 3]
    ]
    assert_equal rotated_matrix, @problem.rotate_matrix(matrix)
  end

  def test_zero_matrix_no_zeros
    matrix = [
      [1, 2],
      [3, 4],
      [5, 6]
    ]

    assert_equal matrix, @problem.zero_matrix(matrix)
  end

  def test_zero_matrix
    matrix = [
      [1, 0],
      [3, 4],
      [5, 6]
    ]

    zero_matrix = [
      [0, 0],
      [3, 0],
      [5, 0]
    ]
    assert_equal zero_matrix, @problem.zero_matrix(matrix)
  end

  def test_is_rotation_different_lengths
    string_1 = "cat"
    string_2 = "cats"

    refute @problem.is_rotation?(string_1, string_2)
  end

  def test_is_rotation_is_true
    string_1 = "melon"
    string_2 = "lonme"

    assert @problem.is_rotation?(string_1, string_2)
  end

  def test_is_rotation_is_false
    string_1 = "melon"
    string_2 = "elnom"

    refute @problem.is_rotation?(string_1, string_2)
  end
end
