class Distrikt < ApplicationRecord
  belongs_to :city
  has_many :matches
  has_many :users, through: :matches
  belongs_to :score, dependent: :destroy
  has_many :places
  has_attachments :photos, maximum: 6
  max_paginates_per 50
  accepts_nested_attributes_for :places
  acts_as_favoritable

  geocoded_by :address
  after_validation :geocode

end
