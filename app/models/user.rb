class User < ApplicationRecord
  has_many :answers
  has_one :test
  has_many :tests_users
  has_many :tests , through: :tests_users
  def tests_by_level(level)
    Test.where(id: Result.where(id: id).test_id).where(level: level)
  end
end
