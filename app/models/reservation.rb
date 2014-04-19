class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  validate :availability

  private
  def availability
    if reservation.availability(party_size, party_time)
      errors.add(:base, "restaurant is full")
    end
  end

end
