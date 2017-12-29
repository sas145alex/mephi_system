class Post < ApplicationRecord
  has_many :post_departments
  has_many :workers, through: :post_departments
  has_many :departments, through: :post_departments

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
end
