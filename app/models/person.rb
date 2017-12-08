class Person < ApplicationRecord
  has_many :workers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :passport, uniqueness: true


  def full_name
    full_name = "#{first_name} " ++ "#{last_name}"
    full_name = full_name ++ " #{second_name}" if self.second_name
    return full_name
  end
end
