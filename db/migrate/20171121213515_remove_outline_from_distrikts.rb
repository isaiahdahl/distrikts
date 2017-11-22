class RemoveOutlineFromDistrikts < ActiveRecord::Migration[5.1]
  def change
    remove_column :distrikts, :outline, :text
  end
end
