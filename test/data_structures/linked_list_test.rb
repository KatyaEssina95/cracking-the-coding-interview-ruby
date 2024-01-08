require_relative "../test_helper"
require "data_structures/linked_list"

class LinkedListTest < Minitest::Test
  def setup
    @linked_list = LinkedList.new
  end

  def test_initialize_with_data
    linked_list = LinkedList.new([1, 2, 3])

    assert_equal 1, linked_list.head.data
    assert_equal 2, linked_list.head.next.data
    assert_equal 3, linked_list.head.next.next.data
    assert_nil linked_list.head.next.next.next
  end

  def test_initialize_without_data
    linked_list = LinkedList.new

    assert_nil linked_list.head
  end

  def test_set_head
    @linked_list.append([1])
    old_head = @linked_list.head
    new_head = Node.new(2)

    @linked_list.head = new_head

    assert_equal new_head, @linked_list.head
    assert old_head, new_head.next
  end

  def test_data_no_nodes
    assert_equal [], @linked_list.data
  end

  def test_data_nodes
    data = [1, 2, 3, 4, 5]
    data.each { |n| @linked_list.append(n) }

    assert_equal data, @linked_list.data
  end

  def test_can_add_head_node
    data = 1

    node = @linked_list.append(data)

    assert_equal data, node.data
    assert_equal node, @linked_list.head
    assert_nil @linked_list.head.next
  end

  def test_can_add_node_to_head
    head = @linked_list.append(1) # create head
    data = 2

    node = @linked_list.append(data)

    assert_equal data, node.data
    assert_equal node, head.next
  end

  def test_find_tail_no_head
    assert_nil @linked_list.find_tail
  end

  def test_can_find_tail_head_only
    node = @linked_list.append(1) # create head

    assert_equal node, @linked_list.find_tail
  end

  def test_can_find_tail
    @linked_list.append(1) # create head
    node = @linked_list.append(2)

    assert_equal node, @linked_list.find_tail
  end

  def test_find_node_empty_list
    refute @linked_list.find(1)
  end

  def test_find_head
    data = 1
    head = @linked_list.append(1)
    (0..10).to_a.each { |i| @linked_list.append(i) }

    assert_equal head, @linked_list.find(data)
  end

  def test_find_middle_node
    (0..4).to_a.each { |i| @linked_list.append(i) }
    data = 5
    node = @linked_list.append(data)
    (6..10).to_a.each { |i| @linked_list.append(i) }

    assert_equal node, @linked_list.find(data)
  end

  def test_find_tail_node
    (0..9).to_a.each { |i| @linked_list.append(i) }
    data = 10
    tail = @linked_list.append(data)

    assert_equal tail, @linked_list.find(data)
  end

  def test_find_non_existent_node
    data = -1
    (0..10).to_a.each { |i| @linked_list.append(i) }

    refute @linked_list.find(data)
  end

  def test_append_after_non_existent_node
    (0..10).to_a.each { |i| @linked_list.append(i) }

    refute @linked_list.append_after(-1, 1)
  end

  def test_append_after_head
    data = 2
    head = @linked_list.append(1)
    tail = @linked_list.append(3)

    node = @linked_list.append_after(head.data, data)

    assert_equal data, node.data
    assert_equal node, head.next
    assert_equal tail, node.next
  end

  def test_append_after_tail
    (0..9).to_a.each { |i| @linked_list.append(i) }
    tail = @linked_list.find_tail
    data = 10

    node = @linked_list.append_after(tail.data, data)

    assert_equal data, node.data
    assert_equal node, tail.next
    assert_nil node.next
  end

  def test_delete_non_existent_node
    (0..9).to_a.each { |i| @linked_list.append(i) }

    assert_nil @linked_list.delete_node(-1)
  end

  def test_delete_head
    head = @linked_list.append(1)
    tail = @linked_list.append(2)

    deleted_node = @linked_list.delete_node(head.data)

    assert_equal head, deleted_node
    assert_equal tail, @linked_list.head
    refute @linked_list.find(deleted_node.data)
  end

  def test_delete_middle_node
    head = @linked_list.append(1)
    middle = @linked_list.append(2)
    tail = @linked_list.append(3)

    deleted_node = @linked_list.delete_node(middle.data)

    assert_equal middle, deleted_node
    assert_equal tail, head.next
    refute @linked_list.find(middle.data)
  end

  def test_delete_tail
    head = @linked_list.append(1)
    tail = @linked_list.append(2)

    deleted_node = @linked_list.delete_node(tail.data)

    assert_equal tail, deleted_node
    assert_nil head.next
    refute @linked_list.find(tail.data)
  end

  def test_print_empty_list
    assert_output("\n") { @linked_list.print }
  end

  def test_print_head_list
    head = @linked_list.append(1)

    assert_output("#{head.data.to_s}\n") { @linked_list.print }
  end

  def test_print_list
    list_data = (0..10).to_a

    list_data.each { |i| @linked_list.append(i) }

    assert_output("#{list_data.join(", ")}\n") { @linked_list.print }
  end
end
