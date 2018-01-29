class Post < ApplicationRecord

  # Nested example (through cocoon)
  # [Book] *---* [Author]
  #
  # has_many :author_books, dependent: :destroy
  # accepts_nested_attributes_for :author_books,
  #   reject_if: :all_blank, allow_destroy: true
  # has_many :authors, through: :author_books

  has_many :post_departments, dependent: :destroy
  accepts_nested_attributes_for :post_departments,
    reject_if: :all_blank

  has_many :departments, through: :post_departments
  has_many :workers, through: :post_departments

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :department_ids, presence: true

  # after_validation :must_be_in_relation_with_departments

  def self.attributes_names
    self.new.attribute_names - ['created_at', 'updated_at']
  end
end
