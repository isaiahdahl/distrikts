class AddCityToDistrikts < ActiveRecord::Migration[5.1]
  def change
    add_reference :distrikts, :city, foreign_key: true
  end
end
