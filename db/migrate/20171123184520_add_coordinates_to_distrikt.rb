class AddCoordinatesToDistrikt < ActiveRecord::Migration[5.1]
  def change
    add_column :distrikts, :latitude, :float
    add_column :distrikts, :longitude, :float
    add_column :distrikts, :address, :string
  end
end
