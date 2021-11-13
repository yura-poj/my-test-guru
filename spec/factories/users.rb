FactoryBot.define do
  factory :user do
    email { 'email@gmail.com' }
    password_digest {'op'}
  end
end
