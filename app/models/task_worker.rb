class TaskWorker < ApplicationRecord
  belongs_to :worker
  belongs_to :task

  validates :status, presence: true, numericality:
    {greater_than_or_equal_to: 0}
  validates :answer, presence: true, numericality:
    {greater_than_or_equal_to: 0}
  # validates :comment, presence: true
  validates :receive_date, presence: true
end
