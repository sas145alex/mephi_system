class Direction < ApplicationRecord
  has_one :task

  validates :name, presence: true
  validates :status, presence: true, numericality:
    {greater_than_or_equal_to: 0}
  validates :receive_date, presence: true
  validates :nominated_date_end, presence: true
end
