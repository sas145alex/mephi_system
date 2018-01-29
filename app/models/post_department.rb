class PostDepartment < ApplicationRecord
  belongs_to :post
  belongs_to :department
  has_many :workers

  validates :post, presence: true, uniqueness: {
    scope: [:department],
    message: 'with these relations already exists'}
  validates :department, presence: true
  # validates :worker, presence: true
end
