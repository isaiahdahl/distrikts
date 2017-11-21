class Style < ApplicationRecord
  belongs_to :score, dependent: :destroy
  has_many :users

  validates :name, presence: true
  validates :description, presence: true
end
