class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: [pending: 0, active: 1, archived: 2]
end
