class AddScoreToDistrikts < ActiveRecord::Migration[5.1]
  def change
    add_reference :distrikts, :score, foreign_key: true
  end
end
