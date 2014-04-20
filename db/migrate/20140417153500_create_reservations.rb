class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :date
      t.string :time
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
