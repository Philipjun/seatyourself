class CreateRestaurants < ActiveRecord::Migration
  def change
    change_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :style
      t.string :url
      t.integer :capacity
      
      
    end
  end
end
