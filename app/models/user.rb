class User < ApplicationRecord
  has_many :answers
  has_one :test
  has_many :tests_users
  has_many :tests, through: :tests_users

  scope :tests_by_level, ->(level) { tests.by_level(level) }

  validates :email, presence: true
end
