class Place < ApplicationRecord
  belongs_to :distrikt

  validates :name, presence: true
  validates :category, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  scope :nightlife, -> { where(category: "nightlife")}
  scope :restaurant, -> { where(category: "restaurant")}
  scope :dessert, -> { where(category: "dessert")}
  scope :shopping, -> { where(category: "shopping")}
  scope :culture, -> { where(category: "culture")}
  scope :outdoors, -> { where(category: "outdoors")}
  scope :cafe, -> { where(category: "cafe")}
end
