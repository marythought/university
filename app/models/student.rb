class Student < ApplicationRecord
  validates :name, presence: true

  def self.majors
    records = Student.select(:major).distinct
    records.map(&:major)
  end
end
