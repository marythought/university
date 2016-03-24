FactoryGirl.define do
  factory :student do
    gpa 3.5

    trait :non_cs do
      name "Mary"
      major "English"
    end

    trait :cs do
      name "Lynn"
      major "CS"
    end
  end
end
