class AddOutlineToDistrikts < ActiveRecord::Migration[5.1]
  def change
    add_column :distrikts, :outline, :float, default: [], array: true
  end
end
