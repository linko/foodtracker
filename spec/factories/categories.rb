FactoryGirl.define do
  factory :category do
    name  { Faker::Category.name }

    factory :weight_category do
      name  "Weight"
    end
  end

end