class Distrikt < ApplicationRecord
  belongs_to :city
  has_many :users, through: :matches
  belongs_to :score, dependent: :destroy
<<<<<<< Updated upstream
=======
  has_many :places
>>>>>>> Stashed changes
end
