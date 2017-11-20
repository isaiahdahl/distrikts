class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :score, dependent: :destroy
  belongs_to :style
  has_many :distrikts, through: :matches
  has_many :reviews
  has_many :places, through: :reviews
end
