class ChangeRestaurants < ActiveRecord::Migration
  def change
    change_table :restaurants do |t|
      t.string :name
      t.integer :address
      t.integer :capacity
      
    end
  end
end

