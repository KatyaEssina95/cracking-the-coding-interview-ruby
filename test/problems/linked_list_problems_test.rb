require_relative "../test_helper"
require "data_structures/linked_list"
require "problems/linked_list_problems"

class LinkedListProblemsTest < Minitest::Test
  include LinkedListProblems

  def test_remove_dupes
    linked_list = LinkedList.new([1, 2, 3, 2, 1])

    linked_list = remove_dupes(linked_list)

    expected_output = "#{[1, 2, 3].join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_no_buffer
    linked_list = LinkedList.new([1, 2, 3, 2, 1])

    linked_list = remove_dupes_no_buffer(linked_list)

    expected_output = "#{[1, 2, 3].join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_consecutive
    data = [1, 1, 1, 2, 3, 4, 4, 4]
    linked_list = LinkedList.new(data)

    linked_list = remove_dupes(linked_list)

    expected_output = "#{data.uniq.join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_no_buffer_consecutive
    data = [1, 1, 1, 2, 3, 4, 4, 4]
    linked_list = LinkedList.new(data)

    linked_list = remove_dupes_no_buffer(linked_list)

    expected_output = "#{data.uniq.join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_no_dupes
    unique_data = (0..100).to_a.sample(10)
    linked_list = LinkedList.new(unique_data)

    linked_list = remove_dupes(linked_list)

    expected_output = "#{unique_data.join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_no_buffer_no_dupes
    unique_data = (0..100).to_a.sample(10)
    linked_list = LinkedList.new(unique_data)

    linked_list = remove_dupes_no_buffer(linked_list)

    expected_output = "#{unique_data.join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_empty_list
    linked_list = LinkedList.new

    linked_list = remove_dupes(linked_list)

    assert_output("\n") do
      linked_list.print
    end
  end

  def test_remove_dupes_no_buffer_empty_list
    linked_list = LinkedList.new

    linked_list = remove_dupes_no_buffer(linked_list)

    assert_output("\n") do
      linked_list.print
    end
  end

  def test_kth_element_empty_list
    linked_list = LinkedList.new

    kth_node = find_kth_to_last_element(linked_list, 0)

    assert_nil kth_node
  end

  def test_kth_element_out_of_range
    data = [1, 2, 3, 4, 5]
    linked_list = LinkedList.new(data)

    assert_raises(StandardError) do
      find_kth_to_last_element(linked_list, data.count + 1)
    end
  end

  def test_kth_last_element
    linked_list = LinkedList.new([1, 2, 3, 4, 5])

    kth_node = find_kth_to_last_element(linked_list, 1)

    assert_equal 5, kth_node.data
  end

  def test_delete_middle_node
    linked_list = LinkedList.new([1, 2, 3, 4, 5])
    node_to_delete = linked_list.find(3)

    delete_middle_node(node_to_delete)

    assert_equal [1, 2, 4, 5], linked_list.data
  end

  def test_partition
    linked_list = LinkedList.new([3, 5, 8, 5, 10, 2, 1])
    partition_element = 5

    partition(linked_list, partition_element)

    data = linked_list.data
    first_partition_index = data.find_index(partition_element)

    data.each_with_index do |d, index|
      if index < first_partition_index
        assert d < partition_element
      else
        assert d >= partition_element
      end
    end
  end

  def test_partition_one_element
    data = [3]
    linked_list = LinkedList.new([3])

    partition(linked_list, 3)

    assert_equal data, linked_list.data
  end

  def test_sum_lists
    list_one = LinkedList.new([7, 1, 6])
    list_two = LinkedList.new([5, 9, 2])

    sum = sum_lists(list_one, list_two)

    assert_equal 912, sum
  end

  def test_sum_lists_uneven_nodes
    list_one = LinkedList.new([7, 1, 6, 2, 3])
    list_two = LinkedList.new([5, 9, 2])

    sum = sum_lists(list_one, list_two)

    assert_equal 32912, sum
  end

  def test_true_palindrome_even
    linked_list = LinkedList.new([1, 2, 2, 1])

    assert palindrome? linked_list
  end

  def test_true_palindrome_odd
    linked_list = LinkedList.new([1, 2, 3, 2, 1])

    assert palindrome? linked_list
  end

  def test_false_palindrome_even
    linked_list = LinkedList.new([1, 2, 3, 4])

    refute palindrome? linked_list
  end

  def test_false_palindrome_odd
    linked_list = LinkedList.new([1, 2, 3, 3, 2])

    refute palindrome? linked_list
  end

  private

  def append_dupes(linked_list, unique_data)
    # Multiply randomly
    dupes_data = []
    unique_data.each do |data|
      (1..5).to_a.sample.times { dupes_data << data }
    end

    # Randomise
    linked_list
  end
end
