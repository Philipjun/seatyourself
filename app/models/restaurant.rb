class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, :through => :reservations

  def availability(party_size)
    party_size <= capacity
  end


end
