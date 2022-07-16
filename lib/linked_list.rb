require_relative 'node'
require 'byebug'

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
    if index >= 0
      return nil if index > @size
      
      idx = index
    else
      return nil if index.abs > @size
      
      idx = @size + index + 1
    end
    
    ptr = @head
    while idx > 1 do
      ptr = ptr.next_node
      idx -= 1
    end
    ptr
  end

  def pop(n = 1)
    return nil if @size == 0
    
    if n >= @size
      initialize
    else
      ptr = @head
      @size -= n
      idx = @size
      while idx > 1 do
        ptr = ptr.next_node
        idx -= 1
      end
      @tail = ptr
      ptr.next_node = @tail
    end
  end
end
