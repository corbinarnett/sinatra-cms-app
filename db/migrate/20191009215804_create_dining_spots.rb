class CreateDiningSpots < ActiveRecord::Migration
  def change
    create_table :dining_spots do |t|
      t.string :name
      t.string :address
      t.string :website
      t.integer :user_id
      t.timestamps null: false
    end
  end
end


#stretch goals: dining_spot type #=> dive bar, cocktail, hi_dining, food_cart