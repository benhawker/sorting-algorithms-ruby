require 'sorting'

describe "Bubble Sort" do

  describe "#bubble_sort" do
    it 'sorts correctly' do
      array = [1,5,5,6,7,8,2,3,5,7,8,7,432,4,6,6,2,3,5,6,3]
      expect(bubble_sort(array)).to eq array.sort
    end

    it 'sorts correctly' do
      array = [1,5,23445,6,7,83245364,2,3,5,4536457,8,7,432,4,3454656,6,2,332435,525434,6,3]
      expect(bubble_sort(array)).to eq array.sort
    end
  end

  describe "#bubble_sort_two" do
    it 'sorts correctly' do
      array = [1,5,5,6,7,8,2,3,5,7,8,7,432,4,6,6,2,3,5,6,3]
      expect(bubble_sort_two(array)).to eq array.sort
    end

    it 'sorts correctly' do
      array = [1,5,23445,6,7,83245364,2,3,5,4536457,8,7,432,4,3454656,6,2,332435,525434,6,3]
      expect(bubble_sort_two(array)).to eq array.sort
    end
  end

end