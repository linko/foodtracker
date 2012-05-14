FactoryGirl.define do
  factory :activity do
    user
    category
    description     { Faker::Lorem.word }
    date   { Date.yesterday    }
  end
end