class Department < ApplicationRecord
  has_many :post_departments
  has_many :workers, through: :post_departments
  has_many :posts, through: :post_departments

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_ancestry :orphan_strategy => :adopt
end
