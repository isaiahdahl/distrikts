class Place < ApplicationRecord
  belongs_to :distrikt

  validates :name, presence: true
  validates :category, presence: true

  acts_as_favoritable

  # All the scope for the filtering in the distrikts show page.
  scope :nightlife, -> { where(category: "nightlife")}
  scope :restaurant, -> { where(category: "restaurant")}
  scope :dessert, -> { where(category: "dessert")}
  scope :shopping, -> { where(category: "shopping")}
  scope :culture, -> { where(category: "culture")}
  scope :outdoors, -> { where(category: "outdoors")}
  scope :cafe, -> { where(category: "cafe")}
end
