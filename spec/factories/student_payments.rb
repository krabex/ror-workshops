FactoryGirl.define do
  factory :student_payment do
    payment_deadline { Faker::Time.between(10.years.ago, 1.years.ago) }
  end
end
