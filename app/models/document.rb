class Document < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :direction, optional: true

  # after_validation :at_least_one_link_must_exist
  before_save :at_least_one_link_must_exist

  def at_least_one_link_must_exist
    if task.nil? && direction.nil?
      self.errors.add(:task, 'ERROR at_least_one_link_must_exist callback')
      self.errors.add(:direction, 'ERROR at_least_one_link_must_exist callback')
      return false
    end
  end
  
end
