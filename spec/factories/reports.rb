FactoryGirl.define do
  factory :report do
    user
    period_start { Date.yesterday }
    period_end   { Date.today }
    email        { Faker::Internet.email }
    subject      { Faker::Lorem.word }
    comments     { Faker::Lorem.paragraph }
  end
end