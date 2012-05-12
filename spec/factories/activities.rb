FactoryGirl.define do
  factory :activity do
    user
    category
    description     { Faker::Lorem.word }
    activity_time   { Date.today        }
  end
end