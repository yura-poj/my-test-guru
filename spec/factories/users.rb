FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "#{n}@example.com" }
    first_name { 'Elon' }
    last_name { 'Mask' }

    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { 1.day.ago }
    current_sign_in_at { 1.day.ago }

    trait :admin do
      admin { true }
    end

  end
end
