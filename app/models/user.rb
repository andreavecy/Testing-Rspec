class User < ApplicationRecord
  has_many :bmis
  # validates
  validates :name, presence: true
  validates :last_name, presence: true

  # methods
  def bmi_average
    data = bmis
    bmi_sum = 0
    data.each do |bmi|
      bmi_sum += Bmi.calculate(bmi.mass, bmi.height)
    end
    bmi_sum / data.count
  end

  def full_name
    "#{name} #{last_name}".titleize
  end

  def most_recent_bmi(limit)
    data = bmis.order(created_at: :desc).limit(limit)
    recent_bmi = []
    data.each do |bmi|
      recent_bmi.push(Bmi.calculate(bmi.mass, bmi.height))
    end
    recent_bmi
  end

end
