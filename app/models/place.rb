class Place < ApplicationRecord
  belongs_to :distrikt
  belongs_to :score, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true

end
