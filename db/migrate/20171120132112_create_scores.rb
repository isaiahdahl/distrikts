class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :artsy
      t.text :artsy_description
      t.integer :authentic
      t.text :authentic_description
      t.integer :trendy
      t.text :trendy_description
      t.integer :foodie
      t.text :foodie_description
      t.integer :walkability
      t.text :walkability_description
      t.integer :touristy
      t.text :touristy_description
      t.integer :shopping
      t.text :shopping_description
      t.integer :nightlife
      t.text :nightlife_description
      t.integer :outdoor
      t.text :outdoor_description
      t.integer :luxury
      t.text :luxury_description
      t.integer :weather
      t.text :weather_description
      t.integer :zen
      t.text :zen_description
      t.timestamps
    end
  end
end
