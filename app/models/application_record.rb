class ApplicationRecord < ActiveRecord::Base
  scope :all_except, ->(record) { where.not(id: record) }

  self.abstract_class = true
end
