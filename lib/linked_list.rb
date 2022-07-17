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
      new_node.next_node = nil
      @head = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
      new_node.next_node = nil
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      new_node.next_node = nil
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
      s << '( '
      s << ptr.value.to_s
      s << ' ) -> '
      ptr = ptr.next_node
      return s << 'nil' if ptr.nil? 
    end
  end

  def insert_at(*args, index)
    ptr = @head
    
    if index >= 0
    
    else
      return nil if index.abs > @size + 1

      if index.abs == @size + 1
        while !args.empty? do
          new_node = Node.new(args.last)
          new_node.next_node = @head
          @head = new_node
          args.pop
          @size += 1
        end
      end

      
    end
  end
end
