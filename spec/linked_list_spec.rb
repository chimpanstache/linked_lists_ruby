require 'linked_list'
require 'node'

RSpec.describe LinkedList do
  describe '#append' do
    list = LinkedList.new

    list.append('1st node')
    list.append('2nd node')
    it 'adds a new node at the end of the list' do
      expect(list.size).to eq 2
      expect(list.head.value).to eq '1st node'
      expect(list.tail.value).to eq '2nd node'
    end
  end

  describe '#append' do
    list = LinkedList.new

    list.prepend('1st node')
    list.prepend('2nd node')
    it 'adds a new node at the start of the list' do
      expect(list.size).to eq 2
      expect(list.head.value).to eq '2nd node'
      expect(list.tail.value).to eq '1st node'
    end
  end

  describe '#size' do
    list = LinkedList.new
  
    it 'returns the current number of nodes contained in the list' do
      expect(list.size).to eq 0
      list.append('blabla')
      expect(list.size).to eq 1
      list.append('more blabla')
      expect(list.size).to eq 2
    end
  end

  describe '#head' do
    list = LinkedList.new

    it 'returns the first node in the list' do
      expect(list.head).to eq nil
      list.append('1st node')
      expect(list.head.value).to eq '1st node'
      list.append('2nd node')
      expect(list.head.value).to eq '1st node'
    end
  end

  describe '#tail' do
    list = LinkedList.new

    it 'returns the last node in the list' do
      expect(list.tail).to eq nil
      list.append('1st node')
      expect(list.tail.value).to eq '1st node'
      list.append('2nd node')
      expect(list.tail.value).to eq '2nd node'
    end
  end
 
  describe '#at' do

    context 'list is not empty' do
      list = LinkedList.new

      list.append('1st node')
      list.append('2nd node')
      it 'returns the node at given index in list' do
        expect(list.at(2).value).to eq '2nd node'
      end
    end
    
    context 'list is empty' do
      list = LinkedList.new
      it 'raises an IndexError' do
        expect{ list.at(0) }.to raise_error(IndexError)
      end
    end    

    context 'index is out of bound' do
      list = LinkedList.new

      list.append('1st node')
      list.append('2nd node')
      it 'raises an IndexError' do
        expect{ list.at(3) }.to raise_error(IndexError)
      end
    end    
  end
end
