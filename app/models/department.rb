class Department < ApplicationRecord
  has_many :post_departments
  has_many :workers, through: :post_departments
  has_many :posts, through: :post_departments
  has_ancestry :orphan_strategy => :adopt

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  before_save :check_exsisting_parent

  private

  def check_exsisting_parent
    if parent_id && !Department.exists?(parent_id)
      errors[:parent] << "Такого департамента не существует!"
      return false
    end
    true
  end

end
