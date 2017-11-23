class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :order, uniqueness: true
end
