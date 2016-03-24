require 'ffaker'

FactoryGirl.define do
  factory :student do
    name  { FFaker::Name.name }
    gpa   3.5
    major { FFaker::Education.major }

    trait :non_cs do
      name  "Mary"
      major "English"
    end

    trait :cs do
      name  "Lynn"
      major "CS"
    end
  end
end
