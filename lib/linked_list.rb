require_relative 'node'

class LinkedList
  attr_accessor :size, :head, :tail
  
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @tail.nil?
      @tail = new_node
      new_node.next_node = @tail
      @head = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
      new_node.next_node = @tail
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      new_node.next_node = @tail
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
    @size += 1
  end

  def at(index)
    raise IndexError.new("Index #{index} outside of list bound 0...#{size - 1}") if index > size
  
    ptr = @head
    while index > 0 do
      ptr = ptr.next_node
      index -= 1
    end
    ptr
  end

  def pop
  end
end

