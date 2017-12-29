class PostDepartment < ApplicationRecord
  belongs_to :post
  belongs_to :department
  belongs_to :worker

  validates :post, presence: true, uniqueness: {
    scope: [:department, :worker],
    message: 'with these relations already exists'}
  validates :department, presence: true
  validates :worker, presence: true
end
