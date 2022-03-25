FactoryBot.define do
  factory :test_passage do
    user
    test
    correct_questions { 0 }
  end
end
