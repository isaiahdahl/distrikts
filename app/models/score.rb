class Score < ApplicationRecord
  has_one :distrikt
  has_one :user
  has_one :answer
  has_one :style
  has_one :place
end
