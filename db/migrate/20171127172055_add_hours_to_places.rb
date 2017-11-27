class AddHoursToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :hour, :string
  end
end
