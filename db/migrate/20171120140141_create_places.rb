class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.string :address
      t.string :phone
      t.text :description
      t.string :img_url

      t.references :distrikt, foreign_key: true
      t.references :score, foreign_key: true

      t.timestamps
    end
  end
end
