class Worker < ApplicationRecord
  has_many :post_departments
  has_many :departments, through: :post_departments
  has_many :posts, through: :post_departments

  belongs_to :person

  validates :contract_start_date, presence: true
  validates :contract_end_date, presence: true
  validates :status, presence: true

  validate :contract_end_date_must_be_later_than_start_date

  def contract_end_date_must_be_later_than_start_date
    return if self.contract_start_date.nil? || self.contract_end_date.nil?
    errors.add(:contract_end_date, 'must be later than contract end date') if
    self.contract_end_date < self.contract_start_date
  end
end
