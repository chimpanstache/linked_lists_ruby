require_relative 'node'
require 'byebug'

class LinkedList
  attr_accessor :size, :head, :tail
  
  def initialize
    @head = @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @tail.nil? # empty list
      @tail = @head = new_node
      new_node.next_node = nil
    else
      @tail = @tail.next_node = new_node
      new_node.next_node = nil
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil? # empty list
      @head = @tail = new_node
      new_node.next_node = nil
    else
      new_node.next_node = @head
      @head = new_node
    end
    @size += 1
  end

  def at(index)
    return nil if index.abs > @size

    if index >= 0
      idx = index
    else
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

  def contains?(value)
    ptr = @head
    while ptr != nil do
      return true if value == ptr.value 
      ptr = ptr.next_node
    end
    false
  end

  def find(value)
    ptr = @head
    idx = 1
    while ptr != nil do
      return idx if value == ptr.value 
      ptr = ptr.next_node
      idx += 1
    end
    nil
  end

  def to_s
    return nil if @size == 0
    
    s = ''
    ptr = @head

    while ptr != nil do
      s << "( #{ptr.value.to_s} ) -> "
      ptr = ptr.next_node
      return s << 'nil' if ptr.nil? 
    end
  end

  def insert_at(*args, index)
    return nil if index > @size || index.abs > @size + 1

    if index.abs == @size + 1 || index == 0 # insert at beginning of list
      while !args.empty? do
        prepend(args[-1])
        args.pop
      end
    elsif index == -1 || index == size # insert at end of list
      while !args.empty? do
        append(args[0])
        args.shift
      end
    else # insert in middle of list
      while !args.empty? do
        new_node = Node.new(args[-1])
        new_node.next_node = at(index + 1)
        at(index).next_node = new_node
        args.pop
        @size += 1
      end
    end
  end

  def remove_at(index)
    return nil if index.abs > @size || @size == 0
    
    if @size == 1
      @tail = @head = nil
    elsif (index.abs == @size && index < 0) || index == 0 # remove at beginning of list
      @head = @head.next_node
    elsif index == -1 || index == size # remove at end of list
      @tail = at(index - 1)
      at(index - 1).next_node = nil
    else # remove in middle of list
      at(index - 1).next_node = at(index + 1)
    end   
    @size -= 1
  end
end
