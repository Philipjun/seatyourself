class AddPartyTimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :party_time, :datetime
  end
end
