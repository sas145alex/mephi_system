class Task < ApplicationRecord
  has_ancestry
  # has_ancestry :orphan_strategy => :adopt
  belongs_to :direction

  has_many :documents

  # callbacks
  before_validation :set_direction_on_node

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
end
