FactoryBot.define do
  factory :product do
    association :subcategory
    association :user
  end
end
