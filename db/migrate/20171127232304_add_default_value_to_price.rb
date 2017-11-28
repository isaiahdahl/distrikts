class AddDefaultValueToPrice < ActiveRecord::Migration[5.1]
  def change
    change_column :places, :price, :integer, default: 2
  end
end
