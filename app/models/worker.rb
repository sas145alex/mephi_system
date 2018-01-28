class Worker < ApplicationRecord
  has_many :post_departments
  has_many :departments, through: :post_departments
  has_many :posts, through: :post_departments

  belongs_to :person

  validates :contract_start_date, presence: true
  # validates :contract_end_date, presence: true
  validates :status, presence: true

  validates :contract_end_date, presence: true

  after_validation :contract_dates_validation

  def contract_dates_validation
    if self[:contract_end_date] <= self[:contract_start_date]
      errors[:contract_end_date] << I18n.t('activerecord.errors.messages.workers.end_date_must_greater_than_start_date')
      return false
    else
      return true
    end
  end

end
