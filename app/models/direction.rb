class Direction < ApplicationRecord
  has_one :task

  has_many :documents
  accepts_nested_attributes_for :documents,
    reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :status, presence: true, numericality:
    {greater_than_or_equal_to: 0}
  validates :receive_date, presence: true
  validates :nominated_date_end, presence: true

  private
  
  def self.attributes_names
    arr = self.new.attribute_names - ['created_at', 'updated_at']
    arr.map(&:to_sym)
  end
end
