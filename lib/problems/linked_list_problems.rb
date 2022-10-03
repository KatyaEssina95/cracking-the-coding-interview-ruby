module LinkedListProblems
  # 2.1
  def remove_dupes(linked_list)
    return linked_list if linked_list.head.nil?

    node = linked_list.head
    chars = {}
    chars[node.data] = 1

    while !node.nil? && !node.next.nil?
      if chars[node.next.data] == nil
        chars[node.next.data] = 1
        node = node.next
      elsif chars[node.next.data] == 1
        # delete duplicate
        node.next = node.next.next
      end
    end

    linked_list
  end

  # 2.1
  def remove_dupes_no_buffer(linked_list)
    return linked_list if linked_list.head.nil?

    node = linked_list.head

    while !node.nil?
      look_ahead_node = node
      while !look_ahead_node.nil? && !look_ahead_node.next.nil?
        if node.data == look_ahead_node.next.data
          # Remove the duplicate without moving the pointer along
          look_ahead_node.next = look_ahead_node.next.next
        else
          look_ahead_node = look_ahead_node.next
        end
      end
      node = node.next
    end

    linked_list
  end
end
