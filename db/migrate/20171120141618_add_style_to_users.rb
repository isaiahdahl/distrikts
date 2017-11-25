class AddStyleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :style, foreign_key: true
  end
end
