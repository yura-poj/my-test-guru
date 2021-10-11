FactoryBot.define do
  factory :test do
    sequence(:title) { |n| "Test#{n}"}
    level { 2 }
    category
    author { User.create}
  end
end
