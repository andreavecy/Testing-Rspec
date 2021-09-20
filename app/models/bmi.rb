class Bmi < ApplicationRecord
  belongs_to :user

  # validates
  validates :mass, presence: true, numericality: { only_float: true }
  validates :height, presence: true, numericality: { only_float: true }

  # methods
  def self.calculate(mass, height)
    (mass / height**2) * 10000
  end
end
