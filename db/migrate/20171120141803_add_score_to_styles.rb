class AddScoreToStyles < ActiveRecord::Migration[5.1]
  def change
    add_reference :styles, :score, foreign_key: true
  end
end
