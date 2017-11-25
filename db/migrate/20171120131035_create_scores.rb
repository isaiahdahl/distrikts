class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :artsy
      t.integer :authentic
      t.integer :trendy
      t.integer :foodie
      t.integer :walkability
      t.integer :touristy
      t.integer :shopping
      t.integer :nightlife
      t.integer :outdoor
      t.integer :luxury
      t.integer :weather
      t.integer :zen
      t.timestamps
    end
  end
end
