class TaskWorker < ApplicationRecord
  belongs_to :worker
  belongs_to :task

  validates :status, presence: true, numericality:
    {greater_than_or_equal_to: 0}
  validates :answer, numericality:
    {greater_than_or_equal_to: 0},
    allow_blank: true
  # validates :comment, presence: true
  # validates :receive_date, presence: true

  before_validation :set_status_on_new_task_worker

  private

  def set_status_on_new_task_worker
    if self.new_record? && self.status.blank?
      self.status = 0
    end
  end
  
end
