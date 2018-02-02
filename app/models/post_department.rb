class PostDepartment < ApplicationRecord
  belongs_to :post
  belongs_to :department

  has_many :workers

  accepts_nested_attributes_for :post
  # accepts_nested_attributes_for :post

  validates :post, presence: true, uniqueness: {
    scope: [:department],
    message: 'with these relations already exists'}
  validates :department, presence: true
  # validates :worker, presence: true

  def self.attributes_names
    arr = self.new.attribute_names - ['created_at', 'updated_at']
    arr.map(&:to_sym)
  end
end
