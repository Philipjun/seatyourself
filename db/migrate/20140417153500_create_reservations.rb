class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :restaurant
      t.string :date
      t.string :time
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :timeslot


      t.timestamps
    end
  end
end
