FactoryGirl.define do
  factory :activity do
    user
    category
    description     { Faker::Lorem.word }
    activity_time   { Date.yesterday    }
  end
end