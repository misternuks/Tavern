class Booking < ApplicationRecord
  enum :status, { pending: 0, accepted: 1, declined: 2 }

  belongs_to :dm_profile
  belongs_to :user

  # validates :dm_profile, uniqueness: { scope: :user }
  validates :date, presence: true
  validates :session_hours, length: { minimum: 1 }
  validates :player_number, length: { minimum: 1 }
  validates :details, length: { maximum: 250 }
end
