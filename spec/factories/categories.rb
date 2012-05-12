FactoryGirl.define do
  factory :category do
    name  { Faker::Lorem.word }

    factory :weight_category do
      name  "Weight"
    end
  end

end