require_relative "../test_helper"
require "data_structures/linked_list"
require "problems/linked_list_problems"

class LinkedListProblemsTest < Minitest::Test
  include LinkedListProblems

  def test_remove_dupes
    data = [1, 2, 3, 2, 1]
    linked_list = LinkedList.new
    data.each { |x| linked_list.append(x) }

    linked_list = remove_dupes(linked_list)

    expected_output = "#{[1, 2, 3].join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_no_buffer
    data = [1, 2, 3, 2, 1]
    linked_list = LinkedList.new
    data.each { |x| linked_list.append(x) }

    linked_list = remove_dupes_no_buffer(linked_list)

    expected_output = "#{[1, 2, 3].join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_consecutive
    data = [1, 1, 1, 2, 3, 4, 4, 4]
    linked_list = LinkedList.new
    data.each { |x| linked_list.append(x) }

    linked_list = remove_dupes(linked_list)

    expected_output = "#{data.uniq.join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_no_buffer_consecutive
    data = [1, 1, 1, 2, 3, 4, 4, 4]
    linked_list = LinkedList.new
    data.each { |x| linked_list.append(x) }

    linked_list = remove_dupes_no_buffer(linked_list)

    expected_output = "#{data.uniq.join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_no_dupes
    unique_data = (0..100).to_a.sample(10)
    linked_list = LinkedList.new
    unique_data.each { |data| linked_list.append(data) }

    linked_list = remove_dupes(linked_list)

    expected_output = "#{unique_data.join(", ")}\n"
    assert_output(expected_output) do
      linked_list.print
    end
  end

  def test_remove_dupes_no_buffer_no_dupes
    unique_data = (0..100).to_a.sample(10)
    linked_list = LinkedList.new
    unique_data.each { |data| linked_list.append(data) }

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
