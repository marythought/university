class Student < ApplicationRecord
  def self.majors
    records = Student.select(:major).distinct
    records.map(&:major)
  end
end
