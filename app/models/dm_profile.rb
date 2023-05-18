class DmProfile < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :price, presence: true
  validates :experience, presence: true
  validates :availability, presence: true
end
