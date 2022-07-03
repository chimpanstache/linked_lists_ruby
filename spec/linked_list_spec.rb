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
    it 'adds a new node at the beginning of the list' do
      expect(list.size).to eq 2
      expect(list.head.value).to eq '2nd node'
      expect(list.tail.value).to eq '1st node'
    end
  end
end
