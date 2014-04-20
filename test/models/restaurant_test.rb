require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  describe Restaurant do
    let(:restaurant) { Restaurant.new(name: 'canoe', capacity: 100)}
    it 'returns true when party size is less than capacity' do 
      expect(restaurant.availability(25)).to be_true
    end
    it 'should return false when party size is greater than capacity' do
      
    end
end
