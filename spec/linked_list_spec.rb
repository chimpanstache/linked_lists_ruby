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
      list.append('3rd node')

      it 'returns the node at given index in list' do
        expect(list.at(3).value).to eq '3rd node'
        expect(list.at(-1).value).to eq '3rd node'
        expect(list.at(-3).value).to eq '1st node'
      end
    end
    
    context 'list is empty' do
      list = LinkedList.new
      it 'returns nil' do
        expect(list.at(0)).to be_nil
      end
    end    

    context 'index is out of bound' do
      list = LinkedList.new

      list.append('1st node')
      list.append('2nd node')
      it 'returns nil' do
        expect(list.at(6)).to be_nil
      end
    end    
  end

  describe '#pop' do
    list = LinkedList.new

    list.append('1st node')
    list.append('2nd node')
    list.append('3rd node')
    list.append('4th node')
    list.append('5th node')
    list.append('6th node')
    list.append('7th node')

    context 'pop is called with a parameter' do
      it 'removes several nodes' do
        list.pop(3)
        expect(list.size).to eq 4
        expect(list.tail.value).to eq('4th node')
      end
    end

    context 'pop is called without a parameter' do
      it 'removes the last element of the list' do
        list.pop
        expect(list.size).to eq 3
        expect(list.tail.value).to eq('3rd node')
      end
    end

    context 'pop is called with a bigger size than the list' do
      it 'deletes the whole list' do
        list.pop(5)
        expect(list.size).to eq 0
        expect(list.tail).to be_nil
        expect(list.head).to be_nil
      end
    end

    context 'on an empty list' do
      it 'does nothing' do
        expect(list.head).to be_nil
        expect(list.tail).to be_nil
      end
    end
  end

  describe '#contains?' do
    context 'when list is empty' do
      list = LinkedList.new
      it 'returns false' do
        expect(list.contains?('value')).to be_falsy
      end
    end

    context 'when value is not in the list' do
      list = LinkedList.new
      list.append('not_value')
      it 'returns false' do
        expect(list.contains?('value')).to be_falsy
      end
    end

    context 'when value is in the list' do
      list = LinkedList.new
      list.append('value')
      it 'returns true' do
        expect(list.contains?('value')).to be_truthy
      end
    end
  end

  describe '#find' do
    context 'when list is empty' do
      list = LinkedList.new
      it 'returns false' do
        expect(list.find('value')).to be_falsy
      end
    end

    context 'when value is not in the list' do
      list = LinkedList.new
      list.append('not_value')
      it 'returns false' do
        expect(list.find('value')).to be_falsy
      end
    end

    context 'when value is in the list' do
      list = LinkedList.new
      list.append('value')
      it 'returns the index of the corresponding value' do
        expect(list.find('value')).to eq 1
      end
    end
  end  

  describe '#to_s' do
    context 'when list is empty' do
      list = LinkedList.new
      it 'returns false' do
        expect(list.to_s).to be_falsy
      end
    end

    context 'when list is not empty' do
      list = LinkedList.new
      list.append('1st node')
      list.append('2nd node')
      list.append('3rd node')

      it 'returns a formatted string' do
        expect(list.to_s).to eq '( 1st node ) -> ( 2nd node ) -> ( 3rd node ) -> nil'
      end
    end
  end

  describe '#insert_at' do
    context 'when index is at the beginning of the list' do
      it 'inserts at the beginning of the list' do
        list = LinkedList.new
        list.insert_at('1st node', 0)
        expect(list.size).to eq 1
        expect(list.at(1).value).to eq '1st node'
      end

      it 'inserts at the beginning of the list' do
        list = LinkedList.new
        list.append('1st node')
        list.append('2nd node')
        list.insert_at('0st node', -3)
        expect(list.size).to eq 3
        expect(list.head.value).to eq '0st node'
      end
    end

    context 'when index is equal to list size or -1' do
      it 'inserts at the end of the list' do
        list = LinkedList.new
        list.append('1st node')
        list.append('2nd node')
        list.insert_at('3rd node', 2)
        expect(list.size).to eq 3
        expect(list.tail.value).to eq '3rd node'
      end

      it 'inserts at the end of the list' do
        list = LinkedList.new
        list.append('1st node')
        list.append('2nd node')
        list.insert_at('3rd node', -1)
        expect(list.size).to eq 3
        expect(list.tail.value).to eq '3rd node'
      end
    end

    context 'when index is inside the list boundaries' do
      it 'inserts in the middle of the list' do
        list = LinkedList.new
        list.append('1st node')
        list.append('2nd node')
        list.append('3rd node')
        list.insert_at('2 & 1/2 node', 2)
        expect(list.size).to eq 4
        expect(list.tail.value).to eq '3rd node'
        expect(list.at(3).value).to eq '2 & 1/2 node'
      end

      it 'inserts in the middle of the list' do
        list = LinkedList.new
        list.append('1st node')
        list.append('2nd node')
        list.append('3rd node')
        list.insert_at('2 & 1/2 node', -2)
        expect(list.size).to eq 4
        expect(list.tail.value).to eq '3rd node'
        expect(list.at(3).value).to eq '2 & 1/2 node'
      end
    end
    
    context 'when index is out of the list boundaries' do
      it 'does not insert' do
        list = LinkedList.new
        list.append('1st node')
        expect(list.insert_at('other node', -3)).to eq nil
        expect(list.contains?('other node')).to be_falsy
        expect(list.insert_at('different node', 2)).to eq nil
        expect(list.contains?('different node')).to be_falsy
      end
    end
  end
end
