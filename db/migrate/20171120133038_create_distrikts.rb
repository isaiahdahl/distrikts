class CreateDistrikts < ActiveRecord::Migration[5.1]
  def change
    create_table :distrikts do |t|
      t.string :name
      t.text :description
      t.text :outline, array: true, default: []
      t.timestamps
    end
  end
end
