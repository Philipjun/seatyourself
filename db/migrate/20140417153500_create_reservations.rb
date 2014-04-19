class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.string :category
      t.belongs_to :restaurant
      t.integer :party_size

      t.timestamps
    end
  end
end
