class User < ApplicationRecord
  has_many :answers
  has_one :test
  has_many :tests_users
  has_many :tests , through: :tests_users

  validates :email, presence: true
  def tests_by_level(level)
    self.tests.by_level(level)
  end
end
