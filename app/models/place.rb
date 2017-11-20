class Place < ApplicationRecord
  belongs_to :distrikt

  validates :name, presence: true
  validates :category, presence: true
end
