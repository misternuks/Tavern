class DmProfile < ApplicationRecord
  belongs_to :user

  validates :price, presence: true
  validates :experience, presence: true
  validates :availability, length: { minimum: 10 }
end
