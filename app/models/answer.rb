class Answer < ApplicationRecord
  belongs_to :score, dependent: :destroy
  belongs_to :question
  has_many :users, through: :user_answers

  validates :score, presence: true
  validates :question_id, presence: true
  validates :img_url, presence: true
end
