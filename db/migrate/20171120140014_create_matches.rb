class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.references :distrikt, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
