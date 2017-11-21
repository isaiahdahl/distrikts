class Place < ApplicationRecord
  belongs_to :distrikt

  validates :name, presence: true
  validates :category, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
end
