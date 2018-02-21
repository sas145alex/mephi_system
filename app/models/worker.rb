class Worker < ApplicationRecord
  belongs_to :person
  belongs_to :post_department

  has_one :department, through: :post_department
  has_one :post,       through: :post_department

  has_many :task_workers
  has_many :tasks, through: :task_workers

  validates :status, presence: true,
    numericality: {greater_than_or_equal_to: 0}
  validates :contract_start_date, presence: true
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
