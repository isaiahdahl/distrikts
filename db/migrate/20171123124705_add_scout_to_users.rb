class AddScoutToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :scout, :boolean, default: false, null: false
  end
end
