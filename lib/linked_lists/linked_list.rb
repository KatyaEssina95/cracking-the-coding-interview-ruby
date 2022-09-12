class Node
  attr_accessor :data, :next

  def initialize(data, next: nil)
    @data = data
    @next = binding.local_variable_get(:next)
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      find_tail.next = node
    end
    node
  end

  def find_tail
    return if head.nil?
    node = head
    while !node.next.nil?
      node = node.next
    end
    node
  end

  def find(data)
    node = head
    while !node.nil?
      return node if node.data == data
      node = node.next
    end
    false
  end

  def append_after(target_data, data)
    node = find(target_data)
    return false unless node

    old_next = node.next
    node.next = Node.new(data, next: old_next)
    node.next
  end

  def delete_node(data)
    # New head - previous node doesn't exist
    if head.data == data
      deleted_node = head
      @head = head.next
      return deleted_node
    end

    node = head
    while !node.next.nil?
      if node.next.data == data
        deleted_node = node.next
        node.next = node.next.next
        return deleted_node
      end
      node = node.next
    end
  end

  def print
    output_arr = []
    node = head
    while !node.nil?
      output_arr << node.data
      node = node.next
    end
    puts output_arr.join(", ")
  end
end
