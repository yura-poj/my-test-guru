class User < ApplicationRecord
  has_many :answers
  has_one :test
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_test, class_name: 'Test'

  scope :new_users, -> (date) { where('created_at > date', date) }

  validates :email, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end
end
