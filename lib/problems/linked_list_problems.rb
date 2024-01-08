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

  # 2.2
  def find_kth_to_last_element(linked_list, k)
    # option 1:
    # find tail first
    # keep track of the length of the list
    # go back k elements

    # option 2:
    # for each element go k steps forward
    # if the next node is nil at x + k, we've reached the right element

    # option 1 is O(2N) -> O(N)
    # option 2 is O(2N) also but I think will be neater

    return if linked_list.head.nil?

    node = linked_list.head
    while node.next
      look_ahead_node = node

      k.times do
        if look_ahead_node.next.nil?
          raise "Value of k is invalid"
        else
          look_ahead_node = look_ahead_node.next
        end
      end

      return look_ahead_node if look_ahead_node.next.nil?
      node = node.next
    end
  end

  # 2.3
  def delete_middle_node(node)
    next_node = node.next

    node.data = next_node.data
    node.next = next_node.next
  end

  # 2.4
  def partition(linked_list, x)
    # iterate through the list, moving all values less than x to be the head node

    node = linked_list.head.next
    previous_node = linked_list.head

    while node
      if node.data < x
        # move node to be the new head
        next_node = node.next

        linked_list.head = node
        previous_node.next = next_node

        node = next_node
      else
        previous_node = node
        node = node.next
      end
    end
  end

  # 2.5
  def sum_lists(list_one, list_two)
    list_one_node = list_one.head
    list_two_node = list_two.head

    sum = 0
    carry = 0
    order = 1

    while list_one_node || list_two_node
      list_one_data = list_one_node&.data || 0
      list_two_data = list_two_node&.data || 0

      sum_digits = list_one_data + list_two_data + carry

      if sum_digits > 9
        sum_digits = sum_digits - 10
        carry = 1
      else
        carry = 0
      end

      sum += order * sum_digits

      list_one_node = list_one_node&.next
      list_two_node = list_two_node&.next
      order *= 10
    end

    sum
  end

  # 2.6
  def palindrome?(linked_list)
    # create the list in reverse
    reverse_list = LinkedList.new
    node = linked_list.head
    length = 0

    while node
      length += 1
      reverse_list.head = node.dup
      node = node.next
    end

    # compare original list & reverse list - data should match
    forward_node = linked_list.head
    reverse_node = reverse_list.head
    (length / 2).times do
      return false if forward_node.data != reverse_node.data

      forward_node = forward_node.next
      reverse_node = reverse_node.next
    end

    true
  end
end
