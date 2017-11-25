class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :description
      t.integer :order
      t.timestamps
    end
  end
end
