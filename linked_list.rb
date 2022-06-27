# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def start_list(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    elsif @tail.nil?
      @head.next_node = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    previous_head = @head
    if @head.nil?
      @head = node
    elsif @tail.nil?
      @tail = previous_head
    else
      @head = node
      @head.next_node = previous_head
    end
  end

  def size
    return 0 if @head.nil?

    node_count = 0
    current_node = @head
    until current_node.nil?
      current_node = current_node.next_node
      node_count += 1
    end
    node_count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    current_node = @head
    index =
      index.times do
        current_node = current_node.next_node
      end
    current_node.value
  end

  def pop
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.next_node.nil?
    last_node = current_node.next_node
    current_node.next_node = nil
    last_node.value
  end

  def contains?(value)
    current_node = @head
    includes_value = false
    until current_node.next_node.nil?
      current_node = current_node.next_node
      includes_value = true if current_node.value == value
    end
    includes_value
  end

  def find(value)
    current_node = @head
    node_index = 0
    until current_node.next_node.nil?
      current_node = current_node.next_node
      node_index += 1
      return node_index if value == current_node.value
    end
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
  end
end
