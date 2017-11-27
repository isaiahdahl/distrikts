class AddPricesToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :price, :integer
  end
end
