FactoryBot.define do
  factory :category do
    sequence(:title) { |n| "Categoty#{n}" }
  end
end
