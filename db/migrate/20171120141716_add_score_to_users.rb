class AddScoreToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :score, foreign_key: true
  end
end
