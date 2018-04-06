class Task < ApplicationRecord
  has_ancestry
  # has_ancestry :orphan_strategy => :adopt
  belongs_to :direction

  has_many :documents
  has_many :task_workers
  has_many :workers, through: :task_workers

  # accepts_nested_attributes_for :tasks,
  #   reject_if: :all_blank, allow_destroy: true

  # callbacks
  before_validation :set_direction_on_node
  before_validation :set_status_on_new_task

  # validations
  validates :description, presence: true
  validates :status, presence: true, numericality:
    {greater_than_or_equal_to: 0}

  # methods
  def set_direction_on_node
    if self.direction_id.nil? && !self.root?
      self.direction = self.root.direction
    end
  end

  def set_status_on_new_task
    if self.status.nil? && self.new_record?
      self.status = 0
    end
  end
end
