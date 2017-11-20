class City < ApplicationRecord
  has_many :distrikts

  validates :name, presence: true
  validates :country, presence: true
  validates :continent, presence: true
end
